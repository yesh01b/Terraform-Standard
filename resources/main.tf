## Terraform version

terraform {
  required_version = "1.7.0"
}

## local backend

terraform {
  backend "local" {
    path = "\resources"
  }
}
