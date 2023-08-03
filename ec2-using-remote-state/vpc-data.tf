data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "nishant_tcs_org"
    workspaces = {
      name = "terraform-vpc-demo"
    }

  }
}