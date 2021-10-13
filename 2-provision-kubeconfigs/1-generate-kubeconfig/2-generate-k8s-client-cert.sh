# WORKER0_HOST=<Public hostname of your first worker node cloud server>
WORKER0_HOST=c76405b1111c.mylabserver.com
# WORKER0_IP=<Private IP of your first worker node cloud server>
WORKER0_IP=172.31.23.25
# WORKER1_HOST=<Public hostname of your second worker node cloud server>
WORKER1_HOST=a6281426161c.mylabserver.com
# WORKER1_IP=<Private IP of your second worker node cloud server>
WORKER1_IP=172.31.30.216

{
cat > ${WORKER0_HOST}-csr.json << EOF
{
"CN": "system:node:${WORKER0_HOST}",
"key": {
"algo": "rsa",
"size": 2048
},
"names": [
{
"C": "US",
"L": "Portland",
"O": "system:nodes",
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
-hostname=${WORKER0_IP},${WORKER0_HOST} \
-profile=kubernetes \
${WORKER0_HOST}-csr.json | cfssljson -bare ${WORKER0_HOST}


cat > ${WORKER1_HOST}-csr.json << EOF
{
"CN": "system:node:${WORKER1_HOST}",
"key": {
"algo": "rsa",
"size": 2048
},
"names": [
{
"C": "US",
"L": "Portland",
"O": "system:nodes",
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
-hostname=${WORKER1_IP},${WORKER1_HOST} \
-profile=kubernetes \
${WORKER1_HOST}-csr.json | cfssljson -bare ${WORKER1_HOST}
}
