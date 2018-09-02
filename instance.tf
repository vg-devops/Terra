

resource "aws_network_interface" "internal_IIP" {
  subnet_id = "${aws_subnet.Public_Subnet1.id}"
  private_ips = ["192.168.0.25"]
  tags {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "first_intance" { //debian linux defined in variables
  ami           = "${var.ami_data.id}"
  instance_type = "${var.ami_data.instance_type}"
    network_interface {
     network_interface_id = "${aws_network_interface.internal_IIP.id}"
     device_index = 0
  }
}

