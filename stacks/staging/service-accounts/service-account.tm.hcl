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
# - _terramate_generated_cloud_run.tf to keep backend configuration DRY

# These configurations can be overwritten by any of the apps
globals {
  sa_account_id   = global.stack_basename
  sa_display_name = terramate.name
}


# Here we generate the cloud run deployment for all our app stacks.
generate_hcl "_terramate_generated_service_account.tf" {
  content {
    module "terraform-google-service-account" {
      source = "github.com/mineiros-io/terraform-google-service-account?ref=v0.0.11"

      account_id   = global.sa_account_id
      display_name = global.sa_display_name
    }

    # output "url" {
    #   description = "URL of the deployed application"
    #   value       = module.cloud_run_app.service.status[0].url
    # }
  }
}
