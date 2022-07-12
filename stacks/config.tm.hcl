# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more information.
#
# To generate/update Terraform code within the stacks
# run `terramate generate` from root directory of the repository.

globals {
  ### TERRAFORM ###############################################################

  ### global variables for use when generating providers
  # all variables defined here can be overwritten in any sub-directory and on the
  # stack level

  # The global terraform version to use
  terraform_version = "~> 1.0"

  # provider settings and defaults
  terraform_google_provider_version = "~> 4.0"
  terraform_google_provider_region  = "europe-north1"

  # this should be adjusted when testing actual deployemnts
  terraform_google_provider_project = "mineiros-terramate-${global.environment}"

  ### global variables for use when generating backend
  # all variables defined here can be overwritten in any sub-directory and on the
  # stack level

  # to demonstrate how to use gloabls in backend configuration
  # the same way you could define state buckets and path within the bucket
  # e.g. setting prefix to terramate.path
  # we use terraforms default for local backends here
  local_tfstate_path = "terraform.tfstate"

  ### GLOBALS ##################################################################

  # global variables for use in terraform code within stacks
  # we use providers project and location by default
  project  = global.terraform_google_provider_project
  location = global.terraform_google_provider_region
}
