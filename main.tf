#create s3 bucket and IAMUser

resource "aws_instance" "web" {
  ami           = var.os #ubuntu
  instance_type = var.size

  tags = {
    Name = var.name
  }
}

#s3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname 
}

resource "aws_iam_user" "myuser" {
  name = "${var.username}-user"
}

output "IPaddress" {
  value = aws_instance.web.public_ip
  
}

output "DNS" {
  value = aws_instance.web.public_dns
  
}

resource "github_repository" "example" {
   name = "this_awesome_github_repo" 
   description = "This resource was created using terraform"

   visibility = "public" 
}