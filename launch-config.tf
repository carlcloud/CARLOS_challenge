resource "aws_launch_configuration" "challenge_config" {
  name                        = "challenge_config-001"
  image_id                    = var.image_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.challenge_ec2_sg.id]
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")
  lifecycle {
    create_before_destroy = true
  }
}