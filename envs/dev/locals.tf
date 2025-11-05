locals {
  env            = "staging"
  location       = "northeurope"
  name_prefix    = "app-${local.env}"
  admin_username = "azureuser"
  common_tags = {
    environment = local.env
    managed_by  = "terraform"
  }

  playbook = "../../ansible-config/playbook.yml"
}

variable "subscription" {
  type = string
}
