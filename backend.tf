terraform {
  backend "s3" {
    bucket         = "ansys-terraform-bucket"
    key            = "terraform.tfstate"
    region         = var.region
    encrypt        = true
  }
}
