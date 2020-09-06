# k3s with terraform on free tier gce instance

1. install terraform
2. `gcloud config set project {your-project}`
3. `gcloud auth application-default login`
4. `terraform apply`
5. `ssh k3s@{created-ip}`
6. `curl -sfL https://get.k3s.io | sh -`
