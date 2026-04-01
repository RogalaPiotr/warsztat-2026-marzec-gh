# KONFIGURACJA ŚRODOWISKA DEV - STEP 2
# Ten plik zawiera wartości specyficzne dla Twojego środowiska Azure

# ============================================================================
# WYMAGANE: Dane Azure
# ============================================================================

subscription_id = "000000-0000-0000-000000000000" # Replace with your subscription ID
tenant_id       = "000000-0000-0000-000000000000" # Replace with your tenant ID

# ============================================================================
# Konfiguracja zasobów
# ============================================================================

# Lokalizacja i Resource Group
location            = "westeurope"
resource_group_name = "rg-workshop-step3gh-dev-we-001"

# Virtual Network
vnet_name          = "vnet-workshop-step3gh-dev-we-001"
vnet_address_space = ["10.0.0.0/16"]

# Subnet
subnet_name             = "snet-workshop-step3gh-dev-we-001"
subnet_address_prefixes = ["10.0.1.0/24"]

# Network Interface
nic_name = "nic-workshop-step3gh-dev-we-001"

# Storage Account (nazwa musi być globalnie unikalna, 3-24 znaki, tylko lowercase)
storage_account_name = "stworkshopstep3ghdev001"

# ============================================================================
# Tagi zasobów
# ============================================================================

tags = {
  project    = "tf-workshop"
  deployedBy = "url|name|tool"
  envType    = "dev"
  owner      = "platform-team"
  costCenter = "CC1000"
}
