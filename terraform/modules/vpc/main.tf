resource "aws_vpc" "main" {
 cidr_block = var.cidr_block
 tags = {
   Name = "devsecops-vpc"
 }
}
resource "aws_subnet" "public" {
 count = length(var.public_subnets)
 vpc_id     = aws_vpc.main.id
 cidr_block = var.public_subnets[count.index]
 map_public_ip_on_launch = true
}