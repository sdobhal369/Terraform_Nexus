terraform {

  required_providers {

    # helm = {
    #   source = "hashicorp/helm"
    # }

    # kubernetes = {
    #   source = "hashicorp/kubernetes"
    # }

    # kubectl = {
    #   source  = "gavinbunney/kubectl"
    # }

    nexus = {
      source = "datadrivers/nexus"
    }
  }

}

#########################################
##           NEXUS DEPLOYMENT          ##
#########################################

resource "nexus_blobstore_file" "blob_storage" {

  name = var.nexus_storage
  path = "/nexus-data/js-storage"

  soft_quota {
    limit = 1024000000
    type  = "spaceRemainingQuota"
  }

}

resource "nexus_security_realms" "nexus_security" {

  active = [
    "NexusAuthenticatingRealm",
    "NexusAuthorizingRealm",
    "npmBearerTokenRealm"
  ]

}

resource "nexus_repository_npm_hosted" "npm_hosted" {

  name = var.npm_hosted
  online = var.nexus_online

  storage {
    blob_store_name                = var.nexus_storage
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }

}

resource "nexus_repository_npm_proxy" "npm_proxy" {

  name   = var.npm_proxy
  online = var.nexus_online

  storage {
    blob_store_name                = var.nexus_storage
    strict_content_type_validation = true
  }

  proxy {
    remote_url       = "https://npmjs.org/"
    content_max_age  = 1440
    metadata_max_age = 1440
  }

  http_client {
    blocked    = false
    auto_block = true
  }

}

resource "nexus_repository_npm_group" "npm_group" {

  name   = var.npm_group
  online = var.nexus_online

  group {
    member_names = [
      nexus_repository_npm_hosted.npm_hosted.name,
      nexus_repository_npm_proxy.npm_proxy.name,
    ]
  }

  storage {
    blob_store_name                = var.nexus_storage
    strict_content_type_validation = true
  }

}