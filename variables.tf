# Definign Key Name for connection
variable "key_name" {
  type        = string
  description = "Name of AWS key pair"
}
# Defining CIDR Block for VPC
variable "vpc_cidr" {
  type = string
}
# Defining CIDR Block for Subnet
variable "subnet_cidr_1" {
  type = string
}
variable "subnet_cidr_2" {
  type = string
}

variable "availability_zone" {
  type = list(any)
}

variable "regions" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "image_id" {
  type = string

}

variable "public_ip" {
  type = bool
}

variable "my_zone" {
  type = string
}

variable "cidr_blocks" {
  type = list(any)
}

variable "port_ingress_01" {
  type = string
}

variable "port_ingress_02" {
  type = string
}