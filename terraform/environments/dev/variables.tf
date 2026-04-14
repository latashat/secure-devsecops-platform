variable "vpc_cidr" {
 type = string
}
variable "public_subnets" {
 type = list(string)
}
variable "cluster_role" {
 type = string
}