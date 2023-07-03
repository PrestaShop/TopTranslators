terraform {
  backend "gcs" {
    prefix = "translators"
    bucket = "ps-eu-w1-terraform-translators-production"
  }
}
