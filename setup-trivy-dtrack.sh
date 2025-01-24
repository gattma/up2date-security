#!/bin/bash

echo ""
echo "======================================"
echo "=== Installing trivy and dtrack ======"
echo "======================================"

helm repo add aqua https://aquasecurity.github.io/helm-charts/
helm repo add dependency-track https://dependencytrack.github.io/helm-charts
helm repo update


helm install trivy-operator aqua/trivy-operator --namespace trivy-system --create-namespace --set="trivy.ignoreUnfixed=true" --version 0.25.0
helm install dtrack dependency-track/dependency-track --namespace dtrack --create-namespace