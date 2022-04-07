// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT
// TERRAMATE: originated from generate_hcl block on /stacks/cloud_run.tm.hcl

module "cloud_run_app" {
  image    = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  location = "europe-north1"
  name     = "terramate-app1-prod"
  source   = "../../../../modules/cloud-run"
}
