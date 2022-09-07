kubectl get deploy,svc -n kube-system | egrep metrics-server
#kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"
kubectl get pods -n kube-system | grep metrics-server   
kubectl apply -f ../../k8s/manifests/k8s/backend-hpa.yaml
#kubectl get hpa
#chmod 755 load_test.sh && ./load_test.sh & kubectl get hpa -w && fg
#kubectl describe hpa
#kubectl apply -f ../../k8s/manifests/k8s/backend-zone-aware.yaml 
#kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'