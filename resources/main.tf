## Terraform version

terraform {
  required_version = "1.4.2"
}

## local backend

terraform {
  backend "local" {
    path = "../statefile/terraform.tfstate"
    features {}
  }
}
