variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret access key"
}

variable count{
  descriptions = "Number of web instances to create"
  default = "2"
}
variable "region"     { 
  description = "AWS region to host your network"
  default     = "us-east-1" 
}

variable "aws_key_pair_path" {
  description = "Local path to AWS key pem file that will be used to ssh to aws instances"
  default=""
}

variable "aws_key_pair_name" {
  description = "Name of the AWS key pair to be added instance to allow ssh access"
}

variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-east-1 = "ami-07bdee6d"
  }
}

variable "user"{
  description = "Username to be prefixed for the hostnames"
  default = "gaurav-tiwari"
}

variable "instance_type" {
  description = "AWS EC2 instance type"
  default = "t2.micro"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
}

variable "private_subnet_cidr_1" {
    description = "CIDR for the Private Subnet"
    default = "10.0.2.0/24"
}

variable db_username{}
variable db_password{}
variable app_name{}
variable environment{}
