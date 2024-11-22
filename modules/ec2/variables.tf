variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "name" {}
variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}