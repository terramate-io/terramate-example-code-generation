# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more information.
#
# To generate/update Terraform code within the stacks
# run `terramate generate` from root directory of the repository.

##############################################################################
# Defaults for each service account that can be overwritten in stacks below
globals {
  # The default name of a cloud run application is terramate-{stack_basename}-{environment}
  app_name = "terramate-${terramate.stack.path.basename}-${global.environment}"

  # The location where the cloud run will be deployed defaults to the global location default.
  app_location = global.location

  # The default docker image to deploy asthe application
  # This should be set to null or not set at all to force each stack to define a specific image
  app_image = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"

  # By default make the cloud run application public.
  # This is not a sane default and should not be used outside of this example
  app_invokers = ["allUsers"]

  # We are using the service account generated for cloud run workloads
  # the service account does not have any access assigned
  # each application can overwrite this global variable to specify a service account
  # that has application specific access rights
  app_service_account_name = "cloud-run@${global.project}.iam.gserviceaccount.com"
}

##############################################################################
# Generate '_terramate_generated_cloud_run.tf' in each stack
# All globals will be replaced with the final value that is known by the stack
# Any terraform code can be defined within the content block
generate_hcl "_terramate_generated_cloud_run.tf" {
  content {

    # We are invoking our local wrapper to the module
    # to also demonstrate terramate orchestration capabilities
    module "cloud_run_app" {
      source = "${terramate.stack.path.to_root}/modules/cloud-run"

      project = global.project

      name                 = global.app_name
      location             = global.app_location
      image                = global.app_image
      service_account_name = global.app_service_account_name

      iam = [
        {
          role    = "roles/run.invoker"
          members = global.app_invokers
        }
      ]
    }

    # An output to show the cloud run url after a successful terraform apply
    output "url" {
      description = "URL of ${global.app_name}"
      value       = module.cloud_run_app.service.status[0].url
    }
  }
}
