data "google_kms_key_ring" "chatstatz_control_key_ring" {
  name     = "chatstatz-control-key-ring"
  location = "global"
}

data "google_kms_crypto_key" "chatstatz_control_tfstate_key" {
  name     = "chatstatz-control-tfstate-key"
  key_ring = data.google_kms_key_ring.chatstatz_control_key_ring.self_link
}
