resource "azurerm_api_management" "core" {
  name                = var.apim_name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name = "Developer_1"

  protocols {
    enable_http2 = true
  }

  tags = var.tags
}


resource "azurerm_api_management_api" "core" {
  name                = var.api_name
  resource_group_name = var.resource_group_name
  api_management_name = azurerm_api_management.core.name
  revision            = "1"
  display_name        = var.api_name
  path                = var.api_path
  protocols           = ["https"]
}

resource "azurerm_api_management_logger" "core" {
  name                = "${var.apim_name}logger"
  api_management_name = azurerm_api_management.core.name
  resource_group_name = var.resource_group_name

  application_insights {
    instrumentation_key = var.application_insights_instrumentation_key
  }
}


resource "azurerm_api_management_api_diagnostic" "core" {
  identifier               = "applicationinsights"
  resource_group_name      = var.resource_group_name
  api_management_name      = azurerm_api_management.core.name
  api_name                 = azurerm_api_management_api.core.name
  api_management_logger_id = azurerm_api_management_logger.core.id


  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "verbose"
  http_correlation_protocol = "W3C"

  frontend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  frontend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }

  backend_request {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "accept",
      "origin",
    ]
  }

  backend_response {
    body_bytes = 32
    headers_to_log = [
      "content-type",
      "content-length",
      "origin",
    ]
  }
}