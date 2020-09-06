# k3s with terraform on free tier gce instance

1. install terraform
2. `terraform init`
3. `gcloud config set project {your-project}`
4. `gcloud auth application-default login`
5. `terraform apply`
6. `ssh k3s@{created-ip}`
7. `curl -sfL https://get.k3s.io | sh -`
