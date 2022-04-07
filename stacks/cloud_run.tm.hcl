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

# Here we generate the cloud run deployment for all our app stacks.
generate_hcl "_terramate_generated_cloud_run.tf" {
  content {
    module "cloud_run_app" {
      source = "../../../../modules/cloud-run"
    }
  }
}
