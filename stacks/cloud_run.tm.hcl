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
  # We get the last dir on the stack path as the name of the app
  _stack_split_path = tm_split("/", terramate.path)
  stack_name = global._stack_split_path[tm_length(global._stack_split_path) - 1]

  app_name = "terramate-${global.stack_name}-${global.environment}"
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

# Output the service URL so we can test it
generate_hcl "_terramate_generated_outputs.tf" {
  content {
    output "url" {
      description = "URL of the deployed application"
      value       = module.cloud_run_app.service.status[0].url
    }
  }
}


