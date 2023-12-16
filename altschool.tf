provider "aws" {
    region "us-east-1"
    }
provider "aws {
    alias = "east"
    region = "eu-west-1"
}

   
    resource "aws_instance" "Altschool1"{ 
        provider = "aws.east" 
        ami = "ami-0fc5d935ebf8bc3bc" 
        instance_type = "t2.micro"
        key_name = "${aws_key_pair.alts1.key_name}"
        subnet_id = "${module.vpc_basic.public_subnets[0]}"
        }

    module "vpc_basic" {
        source = "github.com/terraform-aws-modules/terraform-aws-vpc"
        name = "vpc_basic"
        cidr = "10.0.0.0/16"
        public_subnet = "10.0.1.0/24
    }

    resource "aws_key_pair" "altschool" {
        key_name = "alts1"
        public_key = file ("~/.ssh/id_rsa.pub")
    }

    module "aws_instance" {
        source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
        name = "aws_instance"
        instance_count = 1
        ami = "ami-0fc5d935ebf8bc3bc"
        instance_type = "t2.micro"
        vpc_security_group_ids =
        subnet_id = "${module.vpc_basic.public_subnets[0]}"
        key_name = "${aws_key_pair.alts1.key_name}"

    }
    provisioner "remote-exec" {
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y ansible docker.io
}

     variable "environment" {
        description = "AWS environment Infrastructure    
        type = "string"
        default = "dev"
        }
