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

resource "aws_iam_policy" "name" {
  name = "gd_sns_policy"

   policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sns:Publish",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:sns:${var.region}:${var.account_id}:gd_topic"
      },
    ]
  })
  
}


variable "region" {
  type = string
  description = "Default region for my code"
  default = "us-east-1"
  
}

variable "account_id" {
  type = string
  description = "Default account id for practice"
  default = "641638335125"
  
}