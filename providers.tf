# provider "aws" {
#       region     =  var.region
#       access_key =  var.access_key
#       secret_key = var.secret_key
# }

#######################################
##         HELM PROVIDER             ##
#######################################

# provider "helm" {

#   kubernetes {
#     config_path = "~/.kube/config"
#   }

# }

#######################################
##         KUBERNETES PROVIDER       ##
#######################################

# provider "kubernetes" {

#   config_path = "~/.kube/config"

# }

#######################################
##         KUBECTL PROVIDER          ##
#######################################

# provider "kubectl" {

#   config_path = "~/.kube/config"

# }

#######################################
##         NEXUS PROVIDER            ##
#######################################

provider "nexus" {

  insecure = true
  password = var.nexus_password
  url      = var.nexus_url
  username = var.nexus_username

}
