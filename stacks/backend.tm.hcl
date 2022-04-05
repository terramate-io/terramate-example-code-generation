# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more infromation.
#
# To generate/update Terraform code within the stacks run `terramate generate` from the repositories root directory.

##############################################################################
### TERRAMATE GENERATION #####################################################
##############################################################################
#
# We are generating HCL (.tf) files in every Terramate stack
#
# - _terramate_generated_backend.tf to keep backend configuration DRY
#
### TERRAFORM BACKEND ########################################################

generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {
      backend "local" {
      }
      # Fill out to use remote GCS state
      #backend "gcs" {
        #bucket  = global.state_bucket
        #prefix  = global.state_prefix
      #}
    }
  }
}
