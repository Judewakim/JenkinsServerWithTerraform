variable "ec2_ami" {
  default = "ami-053b0d53c279acc90" // Ubuntu Server 22.04 LTS (HVM), SSD Volume Type in us-east-1
}


variable "ec2_instance_type" {
    type = string
    default = "t2.micro"
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2_key_pair"
  public_key = file("${path.module}/keypair.pub")
}



variable "ec2_security_group" {
    type = string
    default = "sg-02f180edc8873a771" //previously created
}