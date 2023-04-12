# Creating Security Group for EC2

resource "aws_security_group" "challenge_ec2_sg" {
  name        = "challenge_ec2_sg"
  description = "traffic from alb to instances"
  vpc_id      = aws_vpc.challenge_vpc.id
  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    description = "inbound traffic for HTTP service"
    from_port   = var.port_ingress-01
    to_port     = var.port_ingress-01
    protocol    = var.protocol
    security_groups = [aws_security_group.alb_sg.id]
  }

  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = var.port_eng
    to_port     = var.port_eng
    protocol    = var.protocol_eng
    cidr_blocks = var.cidr_blocks
  }
}