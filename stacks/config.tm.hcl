# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more infromation.
#
# To generate/update Terraform code within the stacks run `terramate generate` from the repositories root directory.

globals {
  ### TERRAFORM ###############################################################

  ### global variables for use when generating providers
  # all variables defined here can be overwritten in any sub-directory and on the
  # stack level

  # The global terraform version to use
  terraform_version = "1.1.7"

  # provider settings and defaults
  terraform_google_provider_version = "4.0"
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

  ### HACKS ####################################################################
  #
  # we did not yet implement all details that we would like to use for code
  # generation. Using Terramate Functions we can simulate some of those features.
  # The followin variables will be replaced with terramate native version in
  # future versions of terramate

  # This is a hack that provide us the stacks basename
  stack_basename = tm_reverse(tm_split("/", terramate.path))[0]

  # This is a hack that provides us the relative path to repository root with in a stack
  rootpath_rel = tm_join("/", [for x in tm_split("/", terramate.path) : ".." if x != ""])
}
