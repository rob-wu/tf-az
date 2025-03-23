locals {
  backend_address_pool_name      = "beap-${azurerm_virtual_network.vnet-webapp01.name}"
  frontend_port_name             = "feport-${azurerm_virtual_network.vnet-webapp01.name}"
  frontend_ip_configuration_name = "feip-${azurerm_virtual_network.vnet-webapp01.name}"
  backend_http_setting_name      = "be-htst-${azurerm_virtual_network.vnet-webapp01.name}"
  listener_name                  = "httplstn-${azurerm_virtual_network.vnet-webapp01.name}"
  request_routing_rule_name      = "rqrt-${azurerm_virtual_network.vnet-webapp01.name}"
}

resource "azurerm_application_gateway" "agw-webapp01" {
  name                = "agw-webapp01"
  resource_group_name = azurerm_resource_group.rg-webapp01.name
  location            = azurerm_resource_group.rg-webapp01.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = "agw-ip-configuration"
    subnet_id = data.azurerm_subnet.webapp01-default.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip-rwu-webapp01.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.backend_http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.backend_http_setting_name
  }

  depends_on = [azurerm_virtual_network.vnet-webapp01]
  tags = {
    owner = "terraform"
  }
}