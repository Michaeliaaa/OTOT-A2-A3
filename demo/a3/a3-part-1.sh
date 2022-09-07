kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl -nkube-system edit deploy/metrics-server
#--kubelet-insecure-tls=true
kubectl -nkube-system rollout restart deploy/metrics-server