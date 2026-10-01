variable "project_name" {
  type        = string
  description = "Name prefix for network resources."
}

variable "vpc_cidr" {
  type        = string
  description = "IPv4 CIDR block for the VPC."
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones for public and private subnet pairs."
}

variable "nat_gateway_per_az" {
  description = "Create one NAT Gateway and private route table per Availability Zone."
  type        = bool
  default     = true
}
