resource "aws_vpc" "ansys_vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_support   = "true" 
    enable_dns_hostnames = "true"
    instance_tenancy     = "default"    
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id            = aws_vpc.ansys_vpc.id
    cidr_block        = var.public_subnet_1_cidr
    availability_zone = var.availability_zone_1
    map_public_ip_on_launch = "true"

    tags = {
        Name                     = var.public_subnet_1_name
        "kubernetes.io/role/elb" = "1"
    }
    depends_on = [
      resource.aws_vpc.ansys_vpc
    ]
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id            = aws_vpc.ansys_vpc.id
    cidr_block        = var.public_subnet_2_cidr
    availability_zone = var.availability_zone_2
    map_public_ip_on_launch = "true"

    tags = {
        Name                     = var.public_subnet_2_name
        "kubernetes.io/role/elb" = "1"
    }
    depends_on = [
      resource.aws_vpc.ansys_vpc
    ]
}

resource "aws_subnet" "public_subnet_3" {
    vpc_id            = aws_vpc.ansys_vpc.id
    cidr_block        = var.public_subnet_3_cidr
    availability_zone = var.availability_zone_3
    map_public_ip_on_launch = "true"

    tags = {
        Name                      = var.public_subnet_3_name
        "kubernetes.io/role/elb"  = "1"
    }
    depends_on = [
      resource.aws_vpc.ansys_vpc
    ]
}

resource "aws_subnet" "private_subnet_1" {
    vpc_id            = aws_vpc.ansys_vpc.id
    cidr_block        = var.private_subnet_1_cidr
    availability_zone = var.availability_zone_1
    tags = {
        Name                              = var.private_subnet_1_name
        "kubernetes.io/role/internal-elb" = "1"
    }
    depends_on = [
      resource.aws_vpc.ansys_vpc
    ]
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id            = aws_vpc.ansys_vpc.id
    cidr_block        = var.private_subnet_2_cidr
    availability_zone = var.availability_zone_2
    tags = {
        Name                              = var.private_subnet_2_name
        "kubernetes.io/role/internal-elb" = "1"
    }
    depends_on = [
      resource.aws_vpc.ansys_vpc
    ]
}

resource "aws_subnet" "private_subnet_3" {
    vpc_id            = aws_vpc.ansys_vpc.id
    cidr_block        = var.private_subnet_3_cidr
    availability_zone = var.availability_zone_3
    tags = {
        Name                               = var.private_subnet_3_name
        "kubernetes.io/role/internal-elb"  = "1"
    }
    depends_on = [
      resource.aws_vpc.ansys_vpc
    ]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ansys_vpc.id

  tags = {
    Name = var.intenet_gateway_name
  }
  depends_on = [
    resource.aws_vpc.ansys_vpc
  ]
}

resource "aws_security_group" "ansys_security_group" {
  name               = "ansys-sg"
  description        = "vpc security group"
  vpc_id             = aws_vpc.ansys_vpc.id
  tags = {
    Name = "ansys-sg"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
