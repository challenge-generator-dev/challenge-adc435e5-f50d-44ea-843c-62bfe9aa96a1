# Versión la infraestructura del servicio de notificaciones con Terraform

El equipo de operaciones necesita versionar la infraestructura del servicio de notificaciones utilizando Terraform. El servicio de notificaciones se compone de una red y recursos de computación. La red debe incluir una VPC con subredes públicas y privadas, y los recursos de computación deben consistir en instancias de servidores para manejar las notificaciones. El objetivo es crear un script de Terraform que permita desplegar y versionar esta infraestructura de manera eficiente y reproducible.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 4 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Python 3.10+, pip, VS Code o similar.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `pip install -r requirements.txt` y luego arranca el proyecto. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configurar el entorno de Terraform

**Objetivo:** Preparar el entorno para el despliegue de la infraestructura con Terraform

**Tiempo estimado:** 1 hora

**Instrucciones:**

- Identificar y configurar las variables necesarias para el despliegue.
- Establecer la conexión con el proveedor de nube.
- Verificar que el entorno está correctamente configurado para ejecutar Terraform.

**Entregable:** Entorno de Terraform configurado y listo para el despliegue.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de variables en Terraform.
- Configuración del proveedor de nube en Terraform.

</details>

### Fase 2: Desplegar la red con Terraform

**Objetivo:** Crear y desplegar la red del servicio de notificaciones utilizando Terraform

**Tiempo estimado:** 1 hora

**Instrucciones:**

- Definir la VPC y las subredes públicas y privadas.
- Aplicar las reglas de seguridad necesarias para la red.
- Verificar el despliegue de la red y asegurarte de que cumple con los requisitos.

**Entregable:** Red del servicio de notificaciones desplegada y verificada.

<details>
<summary>Pistas de conocimiento</summary>

- Creación de VPC y subredes en Terraform.
- Aplicación de reglas de seguridad en la red.

</details>

### Fase 3: Desplegar los recursos de computación con Terraform

**Objetivo:** Crear y desplegar los recursos de computación para el servicio de notificaciones utilizando Terraform

**Tiempo estimado:** 1 hora

**Instrucciones:**

- Definir las instancias de servidores necesarias para el servicio.
- Aplicar las configuraciones necesarias para las instancias.
- Verificar el despliegue de los recursos de computación y asegurarte de que cumplen con los requisitos.
- Versionar el despliegue utilizando Terraform.

**Entregable:** Recursos de computación del servicio de notificaciones desplegados y versionados.

<details>
<summary>Pistas de conocimiento</summary>

- Creación de instancias de servidores en Terraform.
- Aplicación de configuraciones en las instancias.
- Versionado de despliegues con Terraform.

</details>

### Fase 4: Validar y documentar el despliegue

**Objetivo:** Validar el despliegue completo de la infraestructura y documentar el proceso

**Tiempo estimado:** 1 hora

**Instrucciones:**

- Realizar pruebas de integración para validar el despliegue.
- Documentar el proceso de despliegue y las decisiones tomadas.
- Preparar un informe detallando el despliegue y las validaciones realizadas.

**Entregable:** Informe detallado del despliegue validado y documentado.

<details>
<summary>Pistas de conocimiento</summary>

- Realización de pruebas de integración.
- Documentación del proceso de despliegue.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en el despliegue de infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para desplegar una red y recursos de computación?
- **erroresComunes**: ¿Cuáles son los errores comunes al desplegar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el versionado de la infraestructura con Terraform?

## Criterios de Evaluacion

- Configuración correcta del entorno de Terraform.
- Despliegue exitoso de la red con Terraform.
- Despliegue exitoso de los recursos de computación con Terraform.
- Versionado correcto del despliegue con Terraform.
- Validación y documentación adecuada del despliegue.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
