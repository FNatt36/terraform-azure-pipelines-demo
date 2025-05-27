provider "azurerm" {
  features {}  # Configuración obligatoria
}

# Crea un Resource Group (grupo de recursos)
resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo"  # Nombre del grupo (cámbialo si quieres)
  location = "eastus"             # Región de Azure (ej: "westus", "northeurope")
}

# Crea un Storage Account (almacenamiento)
resource "azurerm_storage_account" "storage" {
  name                     = "stterraformdemo${substr(uuid(), 0, 4)}"  # ¡Debe ser único en el mundo!
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"  # Tipo de almacenamiento
  account_replication_type = "LRS"       # Redundancia local
}