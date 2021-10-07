variable "twilio_account_sid" {
  type        = string
  sensitive   = true
  description = "Twilio Account SID"
}

variable "twilio_account_auth_token" {
  type        = string
  sensitive   = true
  description = "Twilio Auth Token"
}
