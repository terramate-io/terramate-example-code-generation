# To demo the use of local modules and to show terramate orchestration capabilities
# we define a very simple wrapper to a Mineiros Terraform Module that deploys a
# cloud run application

module "cloud_run" {
  source = "github.com/mineiros-io/terraform-google-cloud-run?ref=v0.0.2"

  name     = var.name
  location = var.location
  project  = var.project
  iam      = var.iam

  template = {
    spec = {
      service_account_name = var.service_account_name

      containers = [
        {
          image = var.image
        }
      ]
    }
  }
}
