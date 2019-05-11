provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_vpc" "Main_VPC" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "Main VPC"
  }
}

resource "aws_internet_gateway" "Main_GW" {
  vpc_id = "${aws_vpc.Main_VPC.id}"

  tags {
    Name = "Main_GW"
  }
}
