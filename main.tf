
# data "aws_ami" "amazon_linux" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["/al2023-ami-2023.0.20230329.0-kernel-6.1-x86_64"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["amazon"] # Canonical
# }

# resource "aws_instance" "challenge_ec2-01" {
#   ami           = "ami-06e46074ae430fba6" #data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
#   associate_public_ip_address = true
#   security_groups =  [aws_security_group.ec2_challenge_sg.id]
#   subnet_id = aws_subnet.SED_challenge_subnet-01.id
#   user_data = file("user_data.sh")

#   tags = {
#     Name = "challenge_ec2-01"
#     Environment =  "DEV"
#   }
# }

# resource "aws_instance" "challenge_ec2-02" {
#    ami           = "ami-06e46074ae430fba6" #data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
#   associate_public_ip_address = true
#   security_groups =  [aws_security_group.ec2_challenge_sg.id]
#   subnet_id = aws_subnet.SED_challenge_subnet-02.id
#   user_data = file("user_data.sh")

#   tags = {
#     Name = "challenge_ec2-02"
#     Environment =  "DEV"
#   }
# }

