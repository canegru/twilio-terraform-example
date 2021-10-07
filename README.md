# Twilio Terraform Example

The following repo is an example of how to:

- Purchase a Twilio phone number
- Create a Messaging Service
- Attach the phone number to the Messaging Service

The following example will keep the Terraform state (backend) on your local machine. For production, you can use any backend highlighted at https://www.terraform.io/docs/language/settings/backends/index.html

## Installation & Execution

### Install Terraform

```bash

# cd into your downloads directory
cd ~/Downloads

# Download Terraform zip
curl -O https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_darwin_amd64.zip

# Unzip Terraform
unzip terraform_1.0.8_darwin_amd64.zip

# Move Terraform into your path
mv ~/Downloads/terraform /usr/local/bin/

# Verify that Terraform is installed
terraform -help

```

For windows or the official installation path, please visit https://www.terraform.io/downloads.html
For the official tutorial, you can navigate to https://learn.hashicorp.com/tutorials/terraform/install-cli

### Usage

#### 1 ) Clone the repo and make an executable script

```bash

# clone this repo
git clone git@github.com:canegru/twilio-terraform-example.git

# cd into the directory
cd twilio-terraform-example

# make a copy of the example bash file
cp example.execute.sh execute.sh

```

#### 2 ) Insert Twilio Credentials

Edit line 1 and line 2 on `execute.sh`. Place your Twilio Account SID into `TWILIO_ACCOUNT_SID` and your Twilio Auth Token into `TWILIO_AUTH_TOKEN`.

```bash
# example
export TWILIO_ACCOUNT_SID="AC........."
export TWILIO_AUTH_TOKEN="............"
```

#### 3 ) Execute the script (Deploy Resources)

Before executing the script, please note that this will purchase services that will incur a charge.

```bash
# execute the shell script
./execute.sh
```

If you have trouble executing the script run `chmod +x ./execute.sh`

#### 3 ) Delete Resources (Destroy Resources)

If you would like to remove the resource `twilio_messaging_services_phone_numbers_v1.attach_number` (phone number) from the messaging server. The Terraform provider will then detach the phone number when executing the script again.

```js

    resource  "twilio_messaging_services_v1"  "messaging_service" {
	    friendly_name = "TerraformExample"
	    sticky_sender = true
	    smart_encoding = true
    }

    # resource  "twilio_messaging_services_phone_numbers_v1"  "attach_number" {
	#    service_sid = twilio_messaging_services_v1.messaging_service.sid
	#    phone_number_sid = twilio_api_accounts_incoming_phone_numbers_v2010.phone_number.sid
    # }

```

## Explanation

`main.tf`
Defines which Terraform module to use.

`numbers.tf`
Purchases a phone number in area code 678 (Georgia), gives the number a friendly name and sets the callbacks

`messaging-service.tf`
Creates a messaging service named `TerraformExample`, enables the sticky sender, and attaches the phone number from `numbers.tf` to the messaging service.

`variables.tf`
Defines variables to be used across the Terraform deployment.
