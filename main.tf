provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

resource "aws_instance" "web_app_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the appropriate AMI ID for your region
  instance_type = "t2.micro"
  tags = {
    Name = "my-app-instance"
  }
}

# Other infrastructure resources, load balancer, security groups, etc. can be added here.
