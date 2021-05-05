module "key_vault" {
  source = "git@github.com:hmcts/cnp-module-key-vault?ref=master"
  name = "${var.product}-${var.env}"
  product = var.product
  env = var.env
  tenant_id = var.tenant_id
  object_id = var.jenkins_AAD_objectId
  resource_group_name = azurerm_resource_group.rg.name
  product_group_object_id = "5d9cd025-a293-4b97-a0e5-6f43efce02c0"
  common_tags = local.tags
  managed_identity_object_ids = ["${data.azurerm_user_assigned_identity.dm-shared-identity.principal_id}"]
  create_managed_identity    = true
}

data "azurerm_user_assigned_identity" "dm-shared-identity" {
  name                = "dm-store-${var.env}-mi"
  resource_group_name = "managed-identities-${var.env}-rg"
}

output "vaultName" {
  value = module.key_vault.key_vault_name
}
