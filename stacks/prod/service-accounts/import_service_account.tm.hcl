# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more information.
#
# To generate/update Terraform code within the stacks
# run `terramate generate` from the repositories root directory.

# This configuration triggers usage of "/modules/service-account/service-account.tm.hcl"
# and demonstrate deduplication of code between staging and prod environment.
# the downside here is that staging and prod will be changed at the same time
# if the mentioned file is changed.

import {
  source = "/modules/service-account/service_account.tm.hcl"
}
