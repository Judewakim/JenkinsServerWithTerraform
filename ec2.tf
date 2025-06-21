
#Deploy 1 EC2 Instances in your Default VPC. Bootstrap the EC2 instance with a script that will install and start Jenkins
resource "aws_instance" "main" {
  ami = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name = aws_key_pair.ec2_key_pair.key_name
  vpc_security_group_ids = [var.ec2_security_group]
  user_data = file("${path.module}/userdata.sh")
  iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name
}

 