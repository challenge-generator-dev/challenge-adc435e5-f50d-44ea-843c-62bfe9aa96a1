# Módulo de compute para el servicio de notificaciones
# Define instancias EC2, launch templates, IPs elásticas y volúmenes EBS

# Datos de AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Instancias EC2 para el servicio de notificaciones
resource "aws_instance" "notification_server" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids = [var.security_group_id]
  user_data              = <<-EOF
#!/bin/bash
apt-get update
apt-get install -y docker.io docker-compose
systemctl start docker
systemctl enable docker
EOF

  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-${count.index + 1}"
    Environment = var.environment
    Role        = "notification-server"
  }
}

# Elastic IP para instancia primaria
resource "aws_eip" "notification" {
  count  = var.assign_eip ? 1 : 0
  domain = "vpc"
  instance = aws_instance.notification_server[0].id
  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-eip"
    Environment = var.environment
  }
}

# Auto Scaling Group (opcional, preparado para escalamiento)
resource "aws_launch_template" "notification_lt" {
  name_prefix   = "${var.project_name}-${var.environment}-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = base64encode(<<-EOF
#!/bin/bash
apt-get update
apt-get install -y docker.io docker-compose
systemctl start docker
systemctl enable docker
EOF
)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-${var.environment}-notification"
      Environment = var.environment
      Role        = "notification-server"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Volumen EBS adicional para datos
resource "aws_ebs_volume" "notification_data" {
  count             = var.instance_count
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  encrypted         = var.ebs_encrypted

  tags = {
    Name        = "${var.project_name}-${var.environment}-notification-data-${count.index + 1}"
    Environment = var.environment
  }
}

# Asociación de volumen EBS
resource "aws_volume_attachment" "notification_data" {
  count       = var.instance_count
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.notification_data[count.index].id
  instance_id = aws_instance.notification_server[count.index].id
}