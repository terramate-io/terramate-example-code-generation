stack {
  name = "Application 2 - prod"

  after = [
    # ensure staging app is deployed before production if both are to be deployed together
    "/stacks/staging/cloud-runs/app2",
  ]
}
