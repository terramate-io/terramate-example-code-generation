stack {
  name = "Application 1 - staging"

  after = [
    "/stacks/staging/service-accounts/cloud-run",
  ]
}
