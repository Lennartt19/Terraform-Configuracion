resource "azurerm_container_app_environment" "cae_01" {
  name                       = var.cae_name
  location                   = azurerm_resource_group.rg_01.location
  resource_group_name        = azurerm_resource_group.rg_01.name
}

resource "azurerm_container_app" "aca_01" {
  name                         = var.aca_name
  container_app_environment_id = azurerm_container_app_environment.cae_01.id
  resource_group_name          = azurerm_resource_group.rg_01.name
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 8080
    transport        = "auto"

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    min_replicas = 1
    max_replicas = 2
    
    container {
      name   = "ms-hello-java"
      image  = "docker.io/lennart19/hello-service:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}