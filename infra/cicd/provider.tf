provider "google" {
  project = "lofty-shine-381715"
  region = "europe-west1"
}

terraform {
  backend "gcs" {
    bucket = "dailydevopsddelimmas-cicd-tf-state"
    prefix = "terraform/state"
    
  }
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 4.56.0"
    }

  }

}