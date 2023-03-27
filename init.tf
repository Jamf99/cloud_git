# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    profile = "dev"
}

resource "aws_instance" "servidor_01" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  tags = {
    Name = "web"
  }
}

resource "aws_instance" "servidor_02" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = {
    Name = "bd"
  }
}

resource "aws_instance" "servidor_03" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = {
    Name = "backend"
  }
}

resource "aws_s3_bucket" "bucket-01" {
  bucket = "jamf-bucket-202303"
  tags = {
    Name = "jamf-bucket-202303"
    Environment = "qa"
  }
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "queue-jamf202303"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}