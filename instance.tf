

resource "aws_network_interface" "internal_IIP" {
  subnet_id = "${aws_subnet.Public_Subnet1.id}"
  private_ips = ["192.168.0.25"]
  tags {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "first_intance" { //debian linux defined in variables
  ami           = "${var.ami["instance_ami"]}"
  instance_type = "${var.ami["instance_type"]}" 
    network_interface {
     network_interface_id = "${aws_network_interface.internal_IIP.id}"
     device_index = 0
    }

  key_name      = "my_key.pub"
  

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt install nginx -y",
    ]

    connection {
      type        = "ssh"
      user        = "vg-devops"
      private_key = "${file("~/.ssh/my_key.peb")}"
    }

  }

}

