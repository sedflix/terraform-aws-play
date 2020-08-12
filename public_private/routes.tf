resource "aws_internet_gateway" "igw-main" {
  vpc_id = aws_vpc.main_vpc.id
}


resource "aws_route_table" "route-table-to-public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-main.id
  }
}

resource "aws_route_table_association" "associated-with-public-route" {
  route_table_id = aws_route_table.route-table-to-public.id
  subnet_id = aws_subnet.public_subnet.id
}

resource "aws_main_route_table_association" "main-association" {
  vpc_id = aws_vpc.main_vpc.id
  route_table_id = aws_route_table.route-table-to-public.id
}


resource "aws_eip" nat_eip {
  vpc = true
}

resource "aws_nat_gateway" "nat-main" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet.id
}


resource "aws_route_table" "route-table-private-to-public-subnet" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-main.id
  }
}

resource "aws_route_table_association" "associated-with-private-to-public-subnet" {
  route_table_id = aws_route_table.route-table-private-to-public-subnet.id
  subnet_id = aws_subnet.private_subnet_1.id
}