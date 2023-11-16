sudo apt-get update
sudo apt-get install ansible openjdk-11-jdk google-cloud-sdk-gke-gcloud-auth-plugin kubectl -y
sudo apt-get clean

#Install ArgoCD Cli
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64