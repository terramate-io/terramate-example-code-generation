# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more information.
#
# To generate/update Terraform code within the stacks
# run `terramate generate` from root directory of the repository.

##############################################################################
# Generate '_terramate_generated_providers.tf' in each stack
# All globals will be replaced with the final value that is known by the stack
# Any terraform code can be defined within the content block
generate_hcl "_terramate_generated_providers.tf" {
  content {

    # the default values of globals are defined in config.tm.hcl in this directory

    provider "google" {
      project = global.terraform_google_provider_project
      region  = global.terraform_google_provider_region
    }

    terraform {
      required_providers {
        google = {
          source  = "hashicorp/google"
          version = global.terraform_google_provider_version
        }
      }
    }

    terraform {
      required_version = global.terraform_version
    }
  }
}
