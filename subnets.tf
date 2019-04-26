resource "aws_subnet" "Public_Subnet1" {
    vpc_id = "${aws_vpc.Main_VPC.id}"

    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "${var.Availability_Zone_A}"
    associate_public_ip_address = true
    tags {
        Name = "Public Subnet 1"
    }
}

resource "aws_subnet" "Private_Subnet3" {
    vpc_id = "${aws_vpc.Main_VPC.id}"

    cidr_block = "${var.private_subnet3_cidr}"
    availability_zone = "${var.Availability_Zone_B}"
    

    tags {
        Name = "Private Subnet 3"
    }
}


