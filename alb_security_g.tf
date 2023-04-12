# Creating Security Group for load balancer
resource "aws_security_group" "alb_sg" {
  name        = "alb_challenge_sg"
  description = "traffic from the internet"
  vpc_id      = aws_vpc.challenge_vpc.id
  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port   = var.port_ingress-01
    to_port     = var.port_ingress-01
    protocol    =var.protocol
    cidr_blocks = var.cidr_blocks
  }
  #HTTPS access from anywhere
  ingress {
    from_port   = var.port_ingress-02
    to_port     = var.port_ingress-02
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }
  #SSH access from anywhere
  ingress {
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
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