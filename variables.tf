variable "aws_region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "availability_zone" {}
variable "vpc_name" {}
variable "ec2_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "ec2_keypair_name" {}
