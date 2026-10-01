variable "region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "nat_gateway_per_az" {
  description = "Create one NAT Gateway and private route table per Availability Zone."
  type        = bool
  default     = false
}
