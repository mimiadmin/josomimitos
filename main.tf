resource "aws_instance" "server" {
  ami             = data.aws_ami.linux2.id
  instance_type   = "t2.medium"
  security_groups = [aws_security_group.jenkins.name]
  key_name        = "assignment"

  tags = {
    Name = "jenkins-zikora"
  }
  user_data = file("jenkins-install.sh")
}