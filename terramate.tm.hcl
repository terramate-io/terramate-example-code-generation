terramate {
  required_version = "~> 0.6.0"

  config {
    run {
      env {
        TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.terraform-cache-dir"
      }
    }
  }
}
