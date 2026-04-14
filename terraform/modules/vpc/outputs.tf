variable "cidr_block" {
 description = "CIDR block for VPC"
 type        = string
}
variable "public_subnets" {
 description = "Public subnet CIDR blocks"
 type        = list(string)
}