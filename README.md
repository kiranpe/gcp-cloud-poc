# GCP Cloud POC
## Tech Stack
1. GCP Cloud
2. Terraform
3. Kubernetes(GKE)
4. Docker
5. Helm
6. Istio
7. ArgoCD
8. Checkov
9. Ansible
10. EFK, Prometheus and Grafana
11. Gitlab
12. Sonarqube
13. Flask
14. Python and Shell Script
15. Jenkins

## How to Steps

## step1:
  Create service account and state bucket. Details are in "gcp-sa-state-bucket" folder.\
  commands:\
  terraform init\
  terraform plan\
  terraform apply -auto-approve
  
  To Destroy: terraform destroy -auto-approve

## step2:
  create vpc, gke, lb and jenkins-vm using "gcp-resources" folder.\
  commands:\
  terraform init --backend-config=backend.config\
  terraform plan\
  terraform apply -auto-approve
  
  To Destroy: terraform destroy -auto-approve