terraform {
  required_providers {
    twilio = {
      source  = "twilio/twilio"
      version = ">=0.4.0"
    }
  }
}

provider "twilio" {
  username = var.twilio_account_sid
  password = var.twilio_account_auth_token
}
