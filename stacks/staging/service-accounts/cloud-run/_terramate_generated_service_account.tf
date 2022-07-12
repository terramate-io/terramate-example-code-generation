// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT
// TERRAMATE: originated from generate_hcl block on /modules/service-account/service_account.tm.hcl

module "terraform-google-service-account" {
  account_id   = "cloud-run"
  display_name = "Cloud Run - Service Account"
  source       = "github.com/mineiros-io/terraform-google-service-account?ref=v0.0.11"
}
