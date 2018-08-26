
variable "aws_access_key" {
  // obtained from environment
}
variable "aws_secret_key" {
  // obtained from environment
}


variable "ami" {
  description = "Debian Linux AMI"
  default = "ami-c7ab5fa0"
}

variable "region" {
  description = "Region for the VPC"
  default = "eu-west-2"
  }

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "192.168.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "CIDR for the public subnet"
  default = "192.168.0.0/18"
}

variable "public_subnet2_cidr" {
  description = "CIDR for the public subnet"
  default = "192.168.64.0/18"
}

variable "private_subnet3_cidr" {
  description = "CIDR for the public subnet"
  default = "192.168.128.0/18"
}

variable "private_subnet4_cidr" {
  description = "CIDR for the public subnet"
  default = "192.168.192.0/18"
}

variable "any_IP_cidr" {
  description = "CIDR for routing to any ip 0.0.0.0/0"
  default = "0.0.0.0/0"
}

variable "local_IP_cidr" {
  description = "CIDR for routing to any ip 192.168.0.0/16"
  default = "192.168.0.0/16"
}

variable "Availability_Zone_A" {
  // obtained from terraform.tfvars
}

variable "Availability_Zone_B" {
  // obtained from terraform.tfvars
}