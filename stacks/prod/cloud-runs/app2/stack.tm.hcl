stack {
  name = "Application 2 - prod"

  after = [
    # ensure staging app is deployed before production if both are to be deployed together
    "/stacks/staging/cloud-runs/app2",

    # ensure the service account used is deployed before the app
    "/stacks/prod/service-accounts/cloud-run",
  ]
}
