export TWILIO_ACCOUNT_SID=""
export TWILIO_AUTH_TOKEN=""

echo "export Ttwilio_account_sid=\"$TWILIO_ACCOUNT_SID\"
export twilio_account_auth_token=\"$TWILIO_AUTH_TOKEN\"" > ./infrastructure/secrets.auto.vars

cd infrastructure

terraform init
terraform plan -out "twilio_infra_planfile"
terraform apply -input=false "twilio_infra_planfile"

echo "Terraform has finished"
cd ../..
