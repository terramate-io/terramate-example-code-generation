// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "cloud_run_app" {
  iam = [
    {
      members = [
        "allUsers",
      ]
      role = "roles/run.invoker"
    },
  ]
  image                = "gcr.io/kubernetes-e2e-test-images/echoserver:2.2"
  location             = "europe-north1"
  name                 = "terramate-app2-prod"
  project              = "example-prod"
  service_account_name = "cloud-run@example-prod.iam.gserviceaccount.com"
  source               = "../../../../modules/cloud-run"
}
output "url" {
  description = "URL of terramate-app2-prod"
  value       = module.cloud_run_app.service.status[0].url
}
