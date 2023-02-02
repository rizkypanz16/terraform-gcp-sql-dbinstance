## Provision GCP DB SQL instance using Terraform

### Steps to provision GCP DB SQL instance with terraform :

- Clone repository
```
git clone https://github.com/rizkypanz16/terraform-gcp-sql-dbinstance.git
```
- Change the configuration below with the GCP configuration you have made 
```
<credentials_file.json>
<project_id>
<db_password>
```
- Init - Initialized terraform provider
```
terraform init
```
- Plan - Preview changes before applying.
```
terraform plan
```
- Apply - Provision reproducible infrastructure.
```
terraform apply
```
