#!/bin/sh
kind create cluster --name kind-1 --config ../../k8s/kind/cluster-config.yaml
docker ps
kubectl cluster-info
kubectl get nodes

kubectl apply -f ../../k8s/manifests/k8s/backend-deployment.yaml
kubectl wait --for=condition=ready pod --selector=app=backend --timeout=60s
kubectl get deployment/backend
kubectl get po -lapp=backend

kubectl apply -f ../../k8s/manifests/k8s/backend-service.yaml
kubectl get svc 

kubectl apply -f ../../k8s/manifests/k8s/backend-ingress.yaml
kubectl wait --for=condition=ready pod --selector=app=backend --timeout=60s
kubectl get ingress

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl -n ingress-nginx get deploy -w

kubectl get ingress