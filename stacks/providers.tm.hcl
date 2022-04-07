# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more infromation.
#
# To generate/update Terraform code within the stacks run `terramate generate` from the repositories root directory.

##############################################################################
### TERRAMATE GENERATION #####################################################
##############################################################################
#
# We are generating HCL (.tf) files in every terramate stack
#
# - _terramate_generated_providers.tf to keep provider and terraform version DRY
#
### PROVIDER & TERRAFORM #####################################################

generate_hcl "_terramate_generated_providers.tf" {
  content {
    provider "google" {
      project = global.terraform_google_provider_project
      region  = global.terraform_google_provider_region
    }

    terraform {
      required_providers {
        # For GCS backend
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
