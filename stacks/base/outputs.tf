output "keyvault_id" {
  value = module.keyvault.keyvault.id
  description = "Key Vault ID"
}

output "des_identity" {
  value = module.des.des.id
  description = "Disk Encryption Set ID"
}