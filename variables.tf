variable "aws_access_key" {
  // automatically obtained from environment by searching for TF_VAR_aws_access_key
}

variable "aws_secret_key" {
  // automatically obtained from environment by searching for TF_VAR_aws_secret_key
}

variable "ami" {
  type        = "map"
  description = "Ubuntu 16.04 Linux AMI for eu-west-2"

  default = {
    instance_ami  = "ami-0f49c6ee8f381746f"
    instance_type = "t2.micro"
  }
}

variable "region" {
  description = "Region for the VPC"
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "192.168.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "CIDR for the public subnet"
  default     = "192.168.0.0/18"
}

variable "public_subnet2_cidr" {
  description = "CIDR for the public subnet"
  default     = "192.168.64.0/18"
}

variable "private_subnet3_cidr" {
  description = "CIDR for the public subnet"
  default     = "192.168.128.0/18"
}

variable "private_subnet4_cidr" {
  description = "CIDR for the public subnet"
  default     = "192.168.192.0/18"
}

variable "any_IP_cidr" {
  description = "CIDR for routing to any ip 0.0.0.0/0"
  default     = "0.0.0.0/0"
}

variable "local_IP_cidr" {
  description = "CIDR for routing to any ip 192.168.0.0/16"
  default     = "192.168.0.0/16"
}

variable "Availability_Zone_A" {
  // obtained from terraform.tfvars
}

variable "Availability_Zone_B" {
  // obtained from terraform.tfvars
}

output "dns_for_instance" {
  description = "Get public DNS name assigned to the instance"
  value       = "${aws_instance.first_intance.public_dns}"
}
