stack {
  name = "Application 2 - staging"

  after = [
    "/stacks/staging/service-accounts/cloud-run",
  ]
}
