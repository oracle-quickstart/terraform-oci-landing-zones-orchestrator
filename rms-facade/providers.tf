# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

terraform {
  required_version = ">= 1.2.0, < 1.3.0"
  required_providers {
    oci = {
      source = "oracle/oci"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "oci" {
  region               = var.region
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  private_key_password = var.private_key_password
}

provider "github" {
  token = var.github_token
}