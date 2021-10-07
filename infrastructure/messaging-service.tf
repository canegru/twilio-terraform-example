resource "twilio_messaging_services_v1" "messaging_service" {
  friendly_name  = "TerraformExample"
  sticky_sender  = true
  smart_encoding = true
}

resource "twilio_messaging_services_phone_numbers_v1" "attach_number" {
  service_sid      = twilio_messaging_services_v1.messaging_service.sid
  phone_number_sid = twilio_api_accounts_incoming_phone_numbers_v2010.phone_number.sid
}
