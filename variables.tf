# variable "access_key" {
#     type = string
#     default = ""
# }

# variable "secret_key" {
#   type = string
#   default = ""
# }

# variable "region" {
#   type = string
#   default = ""
# }

variable "nexus_storage" {

    type    =   string
    default =   "js-storage"

}

variable "npm_hosted" {

  type      =   string
  default   =   "js-packages"

}

variable "npm_proxy" {

  type      =   string
  default   =   "npm-proxy"

}

variable "npm_group" {

  type      =   string
  default   =   "successive_squad-hub"

}

variable "nexus_online" {

type        =   bool
default     =   "true"

}

variable "nexus_username" {

type        =   string
default     =   ""

}

variable "nexus_password" {

type        =   string
default     =   ""

}

variable "nexus_url" {

type        =   string
default     =   ""

}