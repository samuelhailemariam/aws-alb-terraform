# VARIABLES

variable "aws_region" {
  description = "The AWS region to create things in."
  //default     = "us-west-2"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "172.17.0.0/16"
}

variable "stack" {
  description = "Name of the stack."
  default     = "DevForm"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "instance_count" {
  description = "instance count"
  default     = "2"
}

variable "instance_type" {
  description = "instance type"
  default     = "t3.micro"
}

variable "web_port" {
  description = "Web Server Port"
  default     = 80
}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}