kubectl run busybox --image=radial/busyboxplus:curl --command -- sleep 3600
POD_NAME=$(kubectl get pods -l run=busybox -o jsonpath="{.items[0].metadata.name}")

kubectl get ep nginx

kubectl exec $POD_NAME -- curl 10.200.0.2:80
kubectl exec $POD_NAME -- curl 10.200.192.1:80 

kubectl get svc

kubectl exec $POD_NAME -- curl <nginx service IP address>