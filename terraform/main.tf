 terraform {
   required_providers {
     aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
     }
   }

  required_version = ">= 1.2.0"

 }


 provider "aws" {
  region  = "us-east-1"
}



resource "aws_sns_topic" "gd_topic" {
    name = "gd_topic"
  
}

resource "aws_sns_topic_subscription" "email-sub" {
    topic_arn = aws_sns_topic.gd_topic.arn
    endpoint = "kusehsw@gmail.com"
    protocol = "email"
   
    
  
}