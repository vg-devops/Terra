resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.Main_VPC.id}"
 
  route {
    cidr_block = "${var.any_IP_cidr}"
    gateway_id = "${aws_internet_gateway.Main_GW.id}"
  }
 
  tags {
    Name = "RT for Public Subnet"
  }
}

resource "aws_route_table_association" "public-rt" {
  subnet_id = "${aws_subnet.Public_Subnet1.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.Main_VPC.id}"
 
  route {
    cidr_block = "${var.local_IP_cidr}"
   // gateway_id = "${aws_internet_gateway.Main_GW.id}"
   
  }
 
  tags {
    Name = "RT for Private Subnet"
  }
}

resource "aws_route_table_association" "private-rt" {
  subnet_id = "${aws_subnet.Private_Subnet3.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}