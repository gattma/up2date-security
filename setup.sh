#!/bin/bash

# create a new cluster
kind create cluster --name up2date-security

# create the kube-test application
echo ""
echo "======================================"
echo "=== Setting up the kube-test app ====="
echo "======================================"
kubectl create ns kube-test
kubectl apply -f apps/kube-test/kube-test.yaml
sleep 5
# not working: kubectl wait -n kube-test --for=condition=ready pod --selector="app=hello-world" --timeout=90s
echo ""
kubectl get all -n kube-test

# create the nginx application
echo ""
echo "======================================"
echo "=== Setting up the nginx app ========="
echo "======================================"
kubectl create ns nginx
kubectl apply -f apps/nginx/nginx.yaml
sleep 5
# not working: kubectl wait -n nginx --for=condition=ready pod --selector="app=hello-world" --timeout=90s
echo ""
kubectl get all -n nginx
