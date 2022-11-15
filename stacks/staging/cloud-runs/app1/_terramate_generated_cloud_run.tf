// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "cloud_run_app" {
  iam = [
    {
      role = "roles/run.invoker"
      members = [
        "allUsers",
      ]
    },
  ]
  image                = "gcr.io/cloudrun/hello:latest"
  location             = "europe-north1"
  name                 = "terramate-app1-staging"
  project              = "mineiros-terramate-staging"
  service_account_name = "cloud-run@mineiros-terramate-staging.iam.gserviceaccount.com"
  source               = "../../../../modules/cloud-run"
}
output "url" {
  description = "URL of terramate-app1-staging"
  value       = module.cloud_run_app.service.status[0].url
}
