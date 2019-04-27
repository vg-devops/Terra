

resource "aws_network_interface" "internal_IIP" {
  subnet_id = "${aws_subnet.Public_Subnet1.id}"
  private_ips = ["192.168.0.25"]
  tags {
    Name = "primary_network_interface"
  }
 // security_groups
  depends_on = ["aws_security_group.allow_all_in"]
  security_groups = ["${aws_security_group.allow_all_in.id}"]
  //security_groups = ["${aws_security_group.web.id}"]
}

//resource "aws_eip" "elastip_ip" {
 // vpc = true
//}

//resource "aws_eip_association" "eip_assoc" {
//  instance_id   = "${aws_instance.first_intance.id}"
 // allocation_id = "${aws_eip.elastip_ip.id}"
//}

resource "aws_instance" "first_intance" { //debian linux defined in variables
  ami           = "${var.ami["instance_ami"]}"
  instance_type = "${var.ami["instance_type"]}" 
    network_interface {
     network_interface_id = "${aws_network_interface.internal_IIP.id}"
     device_index = 0
     }
  //security_groups =
  //vpc_security_group_ids = ["${aws_security_group.allow_all_in.name}"]
  key_name = "my_key"
  
  tags {
    Name = "Terraform_machine"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/my_key.pem")}"
    }

  }

}


resource "aws_security_group" "allow_all_in" {
  name = "SG allow_all_in"
  description = "Additional VPC SG with full access to/from an instance"
  vpc_id = "${aws_vpc.Main_VPC.id}"
  # TCP access
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

