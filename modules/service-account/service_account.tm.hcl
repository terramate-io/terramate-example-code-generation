# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more information.
#
# To generate/update Terraform code within the stacks
# run `terramate generate` from root directory of the repository.

# This file is defined on a very high level to simulate code deduplication between
# different environments. The same code will be used in staging and production
# triggered by /stacks/{environment}/service-accounts/use_service_account.tm.hcl

##############################################################################
# Defaults for each service account that can be overwritten in stacks below
globals {

  # The default acount ID to use: the stacks directory basename
  sa_account_id = terramate.stack.path.basename

  # The default display name of the Service Account: The name of the configured stack
  sa_display_name = terramate.name
}

##############################################################################
# Generate '_terramate_generated_service_account.tf' in each stack
# that has a global variable 'enable_service_account' set to true
# All globals will be replaced with the final value that is known by the stack
# Any terraform code can be defined within the content block
generate_hcl "_terramate_generated_service_account.tf" {
  content {
    # we use a remote Mineiros Module for service account creation
    module "terraform-google-service-account" {
      source = "github.com/mineiros-io/terraform-google-service-account?ref=v0.0.11"

      account_id   = global.sa_account_id
      display_name = global.sa_display_name
    }
  }
}
