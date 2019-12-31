resource "google_storage_bucket" "chatstatz_tfstate_bucket" {
  name     = "chatstatz-control-tfstate"
  location = local.region

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = data.google_kms_crypto_key.chatstatz_control_tfstate_key.self_link
  }

  labels = {
    repository = "tfstate"
    stage      = "control"
    slice      = "master"
    region     = local.region
    managed-by = "terraform"
  }
}
