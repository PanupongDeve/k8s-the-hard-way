# CERT_HOSTNAME=10.32.0.1,<controller node 1 Private IP>,<controller node 1 hostname>,<controller node 2
# Private IP>,<controller node 2 hostname>,<API load balancer Private IP>,<API load balancer
# hostname>,127.0.0.1,localhost,kubernetes.default

CERT_HOSTNAME=10.32.0.1,172.31.26.49,a56bd118ff1c.mylabserver.com,172.31.31.44,3ab18b3b921c.mylabserver.com,172.31.21.236,47e6d51e631c.mylabserver.com,127.0.0.1,localhost,kubernetes.default




{
cat > kubernetes-csr.json << EOF
{
"CN": "kubernetes",
"key": {
"algo": "rsa",
 "size": 2048
 },
"names": [
 {
"C": "US",
"L": "Portland",
"O": "Kubernetes",
"OU": "Kubernetes The Hard Way",
"ST": "Oregon"
 }
 ]
}
EOF
cfssl gencert \
-ca=ca.pem \
-ca-key=ca-key.pem \
-config=ca-config.json \
-hostname=${CERT_HOSTNAME} \
-profile=kubernetes \
kubernetes-csr.json | cfssljson -bare kubernetes
}