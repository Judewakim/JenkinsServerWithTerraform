
#IAM Trust Policy doc attached to role. “Allow EC2 to assume this role.”
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#creates the actual IAM role
resource "aws_iam_role" "jenkins_ec2_role" {
  name               = "jenkins-ec2-s3-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

#IAM policy. Creates a named IAM policy
resource "aws_iam_policy" "jenkins_s3_policy" {
  name   = "jenkins-s3-access"
  policy = data.aws_iam_policy_document.jenkins_s3_access.json
}

#IAM access policy doc. Defines the permissions you want Jenkins (EC2) to have
data "aws_iam_policy_document" "jenkins_s3_access" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::jenkins-artifacts-bucket",
      "arn:aws:s3:::jenkins-artifacts-bucket/*" 
    ]
  }
}

#attaching policy to the role
resource "aws_iam_role_policy_attachment" "jenkins_attach_policy" {
  role       = aws_iam_role.jenkins_ec2_role.name
  policy_arn = aws_iam_policy.jenkins_s3_policy.arn
}

#Creates an instance profile, which is how EC2 attaches an IAM role
resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "jenkins-instance-profile"
  role = aws_iam_role.jenkins_ec2_role.name
}