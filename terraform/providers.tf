provider "google" {
  version = "~> 3.3"
  project = "chatstatz-control"
  region  = local.region
  # Add the path to your credentials.json file here be for running this templare
  # credentials = file("/path/to/credentials.json")
}
