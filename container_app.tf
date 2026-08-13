resource "azurerm_container_app_environment" "example" {
  name                       = "Example-Environment"
  location                   = data.azurerm_resource_group.sandbox.location
  resource_group_name        = data.azurerm_resource_group.sandbox.name
}

resource "azurerm_container_app" "example" {
  name                         = "example-app"
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = data.azurerm_resource_group.sandbox.name
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 80
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
      name   = "nginx-app"
      image  = "docker.io/nginx:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}