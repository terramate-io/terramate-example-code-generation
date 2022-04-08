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
  app_name     = "terramate-${global.stack_basename}-${global.environment}"
  app_location = global.location
  app_image    = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  app_invokers = ["allUsers"]

  app_service_account_name = "cloud-run@${global.project}.iam.gserviceaccount.com"
}


# Here we generate the cloud run deployment for all our app stacks.
generate_hcl "_terramate_generated_cloud_run.tf" {
  content {
    module "cloud_run_app" {
      source = "${global.rootpath_rel}/modules/cloud-run"

      project = global.project

      service_account_name = global.app_service_account_name

      name     = global.app_name
      location = global.app_location
      image    = global.app_image
      iam = [
        {
          role    = "roles/run.invoker"
          members = global.app_invokers
        }
      ]
    }

    output "url" {
      description = "URL of the deployed application"
      value       = module.cloud_run_app.service.status[0].url
    }
  }
}
