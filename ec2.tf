resource "aws_instance" "web_server" {
  ami= var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet_01.id
  vpc_security_group_ids= [aws_security_group.ssh-http-sg.id]
  availability_zone = "us-west-1a"
  key_name = aws_key_pair.ssh_key.key_name
  user_data= file("userdata(nginx).sh")
  tags = {
      Name= "${var.env}-web-server"
    }
} 

resource "aws_key_pair" "ssh_key" {
  key_name = "server-key"
  public_key= file(var.key)
}