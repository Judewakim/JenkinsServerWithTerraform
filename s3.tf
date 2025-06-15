#Create a S3 bucket for your Jenkins Artifacts that is not open to the public.
resource "aws_s3_bucket" "jenkins_artifacts_bucket" {
    bucket = "luit-terraform1-s3-jenkins-artifacts"
}
