# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more infromation.
#
# To generate/update Terraform code within the stacks run `terramate generate` from the repositories root directory.

globals {
  ### PROVIDER & TERRAFORM #####################################################

  terraform_version                 = "1.1.7"
  terraform_google_provider_version = "4.0"
  terraform_google_provider_region  = "europe-north1"
  terraform_google_provider_project = "mineiros-terramate-${global.environment}"

  project  = global.terraform_google_provider_project
  location = global.terraform_google_provider_region

  # This is a hack that provide us the stacks basename
  # This will be supported by terramate in the future
  stack_basename = tm_reverse(tm_split("/", terramate.path))[0]

  # This is a hack that provides us the relative path to repository root with in a stack
  # This will be supported by terramate in the future
  rootpath_rel = tm_join("/", [for x in tm_split("/", terramate.path) : ".." if x != ""])
}
