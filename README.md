# Setup terraform on local env

## Requirements

* gcloud
* Service Account with the following roles
    * Cloud Run Developer
    * Create Service Accounts
    * Delete Service Accounts
    * Service Account User
    * Storage Admin

## How to run terraform

```bash

# Setup gcloud authentication
export PROJECT=project-id
gcloud auth login --no-launch-browser
gcloud config set project $PROJECT
gcloud auth application-default login --project $PROJECT

# Use a service account during terraform actions
export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=my-sa@project-id.iam.gserviceaccount.com

# run terraform for dev environement (calls modules with variables)
cd terraform/environments/dev
terraform init
terraform plan
```
