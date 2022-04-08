# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more infromation.
#
# To generate/update Terraform code within the stacks run `terramate generate` from the repositories root directory.

globals {
  ### PROVIDER & TERRAFORM #####################################################

  terraform_version = "~> 1.1.0"
  terraform_google_provider_version = "4.0"
  terraform_google_provider_region  = "europe-north1"
  terraform_google_provider_project = "mineiros-terramate-${global.environment}"

  project = global.terraform_google_provider_project
}
