variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
}

variable "nat_gateway_per_az" {
  description = "Create one NAT Gateway and private route table per Availability Zone. This improves egress resilience but increases cost."
  type        = bool
  default     = false
}
