# Jenkins Server on AWS with Terraform 🚀

**A no-nonsense, automated Jenkins setup on AWS using Terraform** — complete with S3 artifact storage, and least-privilege IAM. Perfect for anyone who’s too cool for manual AWS console clicking.

---

## 🔍 What It Does

This repo automates the creation of:

- An **Ubuntu EC2 instance** running Jenkins (bootstrapped via user-data script)
- A **Jenkins Artifacts S3 bucket**
- A scoped **IAM role** attached to the EC2 instance — gives Jenkins read/write access to *only* that bucket

---

## 🚀 Prerequisites

Before you begin, make sure you have:

- ✅ AWS credentials with permissions to create EC2, IAM, S3, and EIP resources  
- ✅ Terraform installed (v1.5+ recommended)  
- ✅ An SSH key pair available for EC2 access  
- ✅ Basic understanding of Terraform, AWS, and IAM  

---

## 🗂️ Repo Structure
```
├── provider.tf # AWS provider + backend configuration
├── variables.tf # Input variables and defaults
├── ec2.tf # EC2 instance, keypair, security group
├── iam.tf # IAM role, policy, instance profile
├── s3.tf # S3 bucket for Jenkins artifacts
├── userdata.sh # Script to install and start Jenkins
├── outputs.tf # Outputs: EIP, Jenkins URL, etc.
└── README.md # <-- you're reading it 😄
```
---

## ⚙️ How to Use It

1. **Clone this repo**  
   ```bash
   git clone https://github.com/Judewakim/JenkinsServerWithTerraform.git
   cd JenkinsServerWithTerraform
2. **Update variables.tf or set environment variables for:**

```
aws_region         = "us-east-1"
ec2_ami            = "ami-0abcdef1234567890" # Ubuntu 22.04 LTS
ec2_instance_type  = "t2.micro"
key_pair_name      = "my-ssh-key"
ec2_security_group = "sg-0abc1234def5678"
```
3. **Initialize Terraform**

```
terraform init
```
4. **See what's coming**

```
terraform plan
```
5. **Apply and build everything**

```
terraform apply
```
6. **Access Jenkins**
After apply finishes, you'll see:

```
Outputs:
jenkins_eip        = 3.45.67.89
jenkins_web_url    = http://3.45.67.89:8080
```
7. **Visit the URL, grab your initial Jenkins password (from Terraform output or via SSH), and start configuring.**

Clean up when done

```
terraform destroy
```
## 🛠 Why It’s Awesome
100% automated — no AWS Console needed after setup

Secure-by-default IAM role scoped tightly to Jenkins’ S3 bucket

Clean separation of Terraform files by resource type for easy maintenance


## 📝 License
MIT License © 2025 Jude Wakim

## 🙌 Thanks
Feel free to ⭐ the repo, file issues, or propose improvements. Let’s automate all the things — and unlock more time for real work.

Happy Terraforming!
