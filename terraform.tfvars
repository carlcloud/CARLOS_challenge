
availability_zone = ["us-east-1a", "us-east-1b"]

regions =  "us-east-1"

public_ip_on_launch = true

subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]

vpc_cidr  = "10.0.0.0/16"

key_name = "awsome_key_pair"

my_zone = "yontasolutions.com" 

port_ingress-01 = 80

port_ingress-02 = 443

cidr_blocks = ["0.0.0.0/0"]

port_ssh = 22
port_eng =  0
protocol = "tcp"
protocol_eng = "-1"