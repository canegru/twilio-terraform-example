resource "twilio_api_accounts_incoming_phone_numbers_v2010" "phone_number" {
  area_code     = "678"
  friendly_name = "terraform test"
  sms_url       = "https://demo.twilio.com/welcome/sms/reply"
  voice_url     = "https://demo.twilio.com/docs/voice.xml"
}

