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
    project    = "chatstatz-control"
    repository = "tfstate"
    stage      = "control"
    slice      = "master"
    region     = local.region
    managed-by = "terraform"
  }
}

resource "google_project_iam_member" "grant_google_storage_service_encrypt_decrypt" {
  role   = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member = "serviceAccount:service-${data.google_project.project.number}@gs-project-accounts.iam.gserviceaccount.com"
}
