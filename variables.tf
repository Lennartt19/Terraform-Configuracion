variable "rg_name" {
    description = "El nombre del grupo de recursos"
    type        = string
}

variable "location" {
    description = "La Region de Azure donde se desplegaran los recursos"
    type        = string
}

variable "cae_name" {
    description = "El nombre del entorno de la aplicación contenedora"
    type        = string
}

variable "aca_name" {
    description = "El nombre de la aplicación contenedora"
    type        = string
}

variable "kv_name" {
    description = "El nombre del Key Vault"
    type        = string
}

variable "identity_01_name" {
    description = "El nombre de la identidad administrada de usuario"
    type        = string
}


variable "subscription_id" {
    description = "El ID de la suscripción de Azure"
    type        = string
}
