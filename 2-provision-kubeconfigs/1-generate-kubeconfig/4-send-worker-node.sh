# scp ca.pem <worker 1 hostname>-key.pem <worker 1 hostname>.pem user@<worker 1 public IP>:~/
scp ca.pem c76405b1111c.mylabserver.com-key.pem c76405b1111c.mylabserver.com.pem  cloud_user@c76405b1111c.mylabserver.com:~/

# scp ca.pem <worker 2 hostname>-key.pem <worker 2 hostname>.pem user@<worker 2 public IP>:~/
scp ca.pem a6281426161c.mylabserver.com-key.pem a6281426161c.mylabserver.com.pem cloud_user@a6281426161c.mylabserver.com:~/
