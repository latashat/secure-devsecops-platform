terraform {
 backend "s3" {
   bucket         = "secure-devsecops-tf-state"
   key            = "global/terraform.tfstate"
   region         = "us-east-1"
   encrypt        = true
   dynamodb_table = "terraform-lock-table"
 }
}