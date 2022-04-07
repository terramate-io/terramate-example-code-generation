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
  app_name = "terramate-app"
  app_location = "europe-north1"
  app_image = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
}

# Here we generate the cloud run deployment for all our app stacks.
generate_hcl "_terramate_generated_cloud_run.tf" {
  content {
    module "cloud_run_app" {
      source = "../../../../modules/cloud-run"

      name = global.app_name
      location = global.app_location
      image = global.app_image
    }
  }
}
