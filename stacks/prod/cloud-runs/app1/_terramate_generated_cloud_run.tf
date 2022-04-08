// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT
// TERRAMATE: originated from generate_hcl block on /stacks/prod/cloud-runs/cloud_run.tm.hcl

module "cloud_run_app" {
  iam = [
    {
      role = "roles/run.invoker"
    members = ["allUsers"] }
  ]
  image    = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  location = "europe-north1"
  name     = "terramate-app1-prod"
  project  = "mineiros-terramate-prod"
  source   = "../../../../modules/cloud-run"
}
output "url" {
  description = "URL of the deployed application"
  value       = module.cloud_run_app.service.status[0].url
}
