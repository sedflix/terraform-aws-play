resource "aws_security_group" "allow_all_in_n_out" {
  name = "allow_all_in_n_out"
  description = "allows all kinds of traffic both ingress and egress"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}


resource "aws_security_group" "allow_all_out_n_in_subnet" {
  name = "allow_all_out_n_in_subnet"
  description = "allows all kinds of traffic both egress but only incoming from a particular subnet"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = [
      var.public_cidr
    ]
  }

  egress {
    from_port = 0
    protocol = -1
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}