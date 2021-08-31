resource "aws_network_interface" "nic-web01" {
  subnet_id   = aws_subnet.snet-web.id
  private_ips = ["198.168.2.5"]

  tags = {
    Name = "nic-pvt-web01"
  }
}

resource "aws_instance" "web01" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  network_interface {
    network_interface_id = aws_network_interface.nic-web01.id
    device_index         = 0
  }
  tags = {
    Name = var.instance_name
  }
}
