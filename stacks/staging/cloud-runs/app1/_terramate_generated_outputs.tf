// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT
// TERRAMATE: originated from generate_hcl block on /stacks/cloud_run.tm.hcl

output "url" {
  description = "URL of the deployed application"
  value       = module.cloud_run_app.service.status[0].url
}
