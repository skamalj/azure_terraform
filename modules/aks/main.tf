terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.name
  location                  = data.azurerm_resource_group.resource_group.location
  resource_group_name       = data.azurerm_resource_group.resource_group.name
  kubernetes_version        = var.kubernetes_version
  dns_prefix                = var.name
  automatic_channel_upgrade = var.automatic_channel_upgrade

  azure_active_directory_role_based_access_control {
    managed                = true
    admin_group_object_ids = var.aks_admin_group_object_ids
    azure_rbac_enabled     = true
  }

  azure_policy_enabled             = var.azure_policy_enabled
  disk_encryption_set_id           = var.disk_encryption_set_id
  http_application_routing_enabled = var.http_application_routing_enabled
  dynamic "ingress_application_gateway" {
    for_each     = var.create_ingress_application_gateway ? [var.ingress_application_gateway_name] : []
    content {
        gateway_name = var.ingress_application_gateway_name
        gateway_id   = var.ingress_application_gateway_id
        subnet_id    = var.ingress_application_gateway_subnet_id
    }
  }

  identity {
    type = "SystemAssigned"
  }

  dynamic "oms_agent" {
    for_each = try(var.log_analytics_workspace_id, null) == null ? [] : [1]
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }
  dynamic "aci_connector_linux" {
    for_each = try(var.aci_subnet_name, null) == null ? [] : [1]
    content {
      subnet_name = var.aci_subnet_name
    }
  }
  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = var.secret_rotation_interval
  }

  dynamic "linux_profile" {
    for_each = try(var.admin_username, null) != null ? [1] : []
    content {
      admin_username = var.admin_username
      ssh_key {
        key_data = var.ssh_key_data
      }
    }
  }
  dynamic "windows_profile" {
    for_each = try(var.admin_username, null) == null ? [] : [1]
    content {
      admin_username = var.win_admin_username
      admin_password = var.win_admin_password
    }
  }
  maintenance_window {
    allowed {
      day   = var.maintenance_window_day
      hours = var.maintenance_window_hours
    }
  }


  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_plugin == "azure" ? "azure" : "calico"
    outbound_type      = var.outbound_type
    service_cidr       = var.service_cidr
    pod_cidr           = var.pod_cidr
    docker_bridge_cidr = var.docker_bridge_cidr
    dns_service_ip     = join(".", concat(slice(split(".", var.service_cidr), 0, 3), ["10"]))
  }

  node_resource_group       = var.node_pool_resource_group_name
  oidc_issuer_enabled       = var.oidc_issuer_enabled
  open_service_mesh_enabled = var.open_service_mesh_enabled

  private_cluster_enabled             = var.private_cluster_enabled
  api_server_authorized_ip_ranges     = var.private_cluster_enabled ? null : var.api_server_authorized_ip_ranges
  private_cluster_public_fqdn_enabled = var.private_cluster_enabled ? var.private_cluster_public_fqdn_enabled : null

  public_network_access_enabled     = var.public_network_access_enabled
  role_based_access_control_enabled = var.role_based_access_control_enabled

  default_node_pool {
    name    = try(var.default_node_pool_name, "nodepool1")
    vm_size = var.vm_size

    enable_auto_scaling = true
    zones               = var.zones
    max_count           = var.max_count
    min_count           = var.min_count
    node_count          = var.node_count
    type                = "VirtualMachineScaleSets"

    enable_host_encryption = var.enable_host_encryption
    fips_enabled           = var.fips_enabled

    enable_node_public_ip = var.enable_node_public_ip
    orchestrator_version  = var.kubernetes_version

    max_pods       = var.max_pods
    node_labels    = var.node_labels
    pod_subnet_id  = var.network_plugin == "azure" ? var.pod_subnet_id : null
    vnet_subnet_id = var.node_subnet_id
    upgrade_settings {
      max_surge = var.pool_max_surge_for_upgrade

    }
  }
  lifecycle {
    ignore_changes = [
      default_node_pool.0.node_count
    ]
  }
}
