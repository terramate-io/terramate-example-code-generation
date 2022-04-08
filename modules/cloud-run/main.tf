# Since we already have a cloud run module this local module is not
# really necessary, we just added it to show case change detection
# when referencing local modules.

module "cloud_run" {
  source = "github.com/mineiros-io/terraform-google-cloud-run?ref=v0.0.2"

  name     = var.name
  location = var.location

  template = {
    spec = {
      containers = [
        {
          image = var.image
        }
      ]
    }
  }

  # It will be a public service
  # https://cloud.google.com/run/docs/authenticating/public#yaml
  iam = [
    {
      members = ["allUsers"]
      role    = "roles/run.invoker"
    }
  ]
}
