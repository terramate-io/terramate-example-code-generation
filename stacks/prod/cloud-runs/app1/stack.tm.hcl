stack {
  name = "Application 1 - prod"

  after = [
    # ensure staging app is deployed before production if both are to be deployed together
    "/stacks/staging/cloud-runs/app1",

    # ensure the service account used is deployed before the app
    "/stacks/prod/service-accounts/cloud-run",
  ]
}
