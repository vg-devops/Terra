resource "aws_subnet" "Public_Subnet1" {
    vpc_id = "${aws_vpc.Main_VPC.id}"

    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "${var.Availability_Zone_A}"
    map_public_ip_on_launch = true
    tags {
        Name = "Public Subnet 1"
    }
}

resource "aws_subnet" "Private_Subnet3" {
    vpc_id = "${aws_vpc.Main_VPC.id}"

    cidr_block = "${var.private_subnet3_cidr}"
    availability_zone = "${var.Availability_Zone_B}"
    map_public_ip_on_launch = false    

    tags {
        Name = "Private Subnet 3"
    }
}

resource "aws_network_acl" "main" {
  vpc_id = "${aws_vpc.Main_VPC.id}"
  subnet_ids = ["${aws_subnet.Public_Subnet1.id}"]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1
    to_port    = 1024
  }

  tags = {
    Name = "main"
  }
}
