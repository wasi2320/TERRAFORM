resource "aws_security_group" "ssh-http-sg" {
   vpc_id = aws_vpc.my_vpc.id

   ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
   tags = {
      Name= "${var.env}-ssh-http-sg"
    }
}

resource "aws_security_group" "LoadBalancer-sg" {
   vpc_id = aws_vpc.my_vpc.id

   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      Name= "${var.env}-LoadBalancer-sg"
    }
}

resource "aws_security_group" "ECS-sg" {
   vpc_id = aws_vpc.my_vpc.id

   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups= [aws_security_group.LoadBalancer-sg.id]
   }

   tags = {
      Name= "${var.env}-ECS-sg"
    }
}
