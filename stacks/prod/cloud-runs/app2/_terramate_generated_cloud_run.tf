// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT
// TERRAMATE: originated from generate_hcl block on /modules/cloud-run/cloud_run.tm.hcl

module "cloud_run_app" {
  iam = [
    {
      role = "roles/run.invoker"
      members = [
        "allUsers",
      ]
    },
  ]
  image                = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  location             = "europe-north1"
  name                 = "terramate-app2-prod"
  project              = "mineiros-terramate-prod"
  service_account_name = "cloud-run@mineiros-terramate-prod.iam.gserviceaccount.com"
  source               = "../../../../modules/cloud-run"
}
output "url" {
  description = "URL of terramate-app2-prod"
  value       = module.cloud_run_app.service.status[0].url
}
