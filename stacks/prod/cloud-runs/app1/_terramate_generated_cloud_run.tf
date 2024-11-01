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
  image                = "gcr.io/cloudrun/hello:latest"
  location             = "europe-north1"
  name                 = "terramate-app1-prod"
  project              = "example-prod"
  service_account_name = "cloud-run@example-prod.iam.gserviceaccount.com"
  source               = "../../../../modules/cloud-run"
}
output "url" {
  description = "URL of terramate-app1-prod"
  value       = module.cloud_run_app.service.status[0].url
}
