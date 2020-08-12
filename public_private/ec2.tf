data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }

  owners = [
    "099720109477"]
  # Canonical
}

resource "aws_instance" public_server_1 {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = var.aws_key_name
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [
    aws_security_group.allow_all_in_n_out.id
  ]
}

resource "aws_instance" private_server_1 {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = var.aws_key_name
  subnet_id = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = [
    aws_security_group.allow_all_out_n_in_subnet.id
  ]
}