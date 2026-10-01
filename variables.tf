variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{1,30}$", var.project_name))
    error_message = "project_name must start with a lowercase letter and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block."
  }
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)

  validation {
    condition     = length(var.azs) >= 2 && length(distinct(var.azs)) == length(var.azs)
    error_message = "azs must contain at least two distinct Availability Zones."
  }
}

variable "nat_gateway_per_az" {
  description = "Create one NAT Gateway and private route table per Availability Zone. This improves egress resilience but increases cost."
  type        = bool
  default     = true
}
