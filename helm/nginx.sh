#!/bin/bash

# Step 1: Update package index
sudo apt update

# Step 2: Install required dependencies (https, gnupg, curl)
sudo apt install -y apt-transport-https gnupg curl

# Step 3: Add the Helm GPG key for package verification
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -

# Step 4: Add the Helm stable repository to the sources list
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# Step 5: Update package index again with the new Helm repository
sudo apt update

# Step 6: Install Helm
sudo apt install -y helm

# Verify Helm installation
helm version

# Step 7: Add the Bitnami repository for charts
helm repo add bitnami https://charts.bitnami.com/bitnami

# Step 8: Update the Helm repository to get the latest charts
helm repo update

# Step 9: Install Nginx using the Bitnami Helm chart
helm install my-nginx bitnami/nginx

# Step 10: Get the service details of the Nginx deployment
kubectl get svc my-nginx

# Step 11: Port-forward to access the Nginx service on your local machine
kubectl port-forward svc/my-nginx 8080:80
