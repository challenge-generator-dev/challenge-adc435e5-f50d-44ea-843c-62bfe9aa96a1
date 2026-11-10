# Dockerfile multi-stage para el servicio de notificaciones
# Etapa de build: compila la aplicación
# Etapa final: imagen optimizada con solo los artefactos necesarios

FROM python:3.11-slim AS builder

WORKDIR /build

# Instalar dependencias de build
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos de dependencias
COPY requirements.txt .

# Instalar dependencias en entorno virtual
RUN python -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

# Copiar código fuente
COPY src/ ./src/

# Etapa de producción
FROM python:3.11-slim AS production

WORKDIR /app

# Crear usuario no root para seguridad
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Copiar únicamente el entorno virtual de la etapa builder
COPY --from=builder /venv /venv

# Copiar código de la aplicación
COPY --from=builder /build/src ./src

# Configurar entorno virtual
ENV PATH="/venv/bin:$PATH" \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Exponer puerto de la aplicación
EXPOSE 8080

# Cambiar a usuario no root
USER appuser

# Healthcheck para verificar que la aplicación está funcionando
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8080/health') || exit(1)" || exit 1

# Comando de inicio
CMD ["python", "-m", "src.main"]