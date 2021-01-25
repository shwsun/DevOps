#스왑 오프
sudo swapoff -a
## master 
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.56.10
# sudo kubeadm config images pull
# [config/images] Pulled k8s.gcr.io/kube-apiserver:v1.20.2
# [config/images] Pulled k8s.gcr.io/kube-controller-manager:v1.20.2
# [config/images] Pulled k8s.gcr.io/kube-scheduler:v1.20.2
# [config/images] Pulled k8s.gcr.io/kube-proxy:v1.20.2
# [config/images] Pulled k8s.gcr.io/pause:3.2
# [config/images] Pulled k8s.gcr.io/etcd:3.4.13-0
# [config/images] Pulled k8s.gcr.io/coredns:1.7.0
# sudo docker tag k8s.gcr.io/kube-proxy:v1.20.2 shwsun/kube-proxy:v1.20.2
# sudo docker tag k8s.gcr.io/kube-apiserver:v1.20.2 shwsun/kube-apiserver:v1.20.2
# sudo docker tag k8s.gcr.io/kube-scheduler:v1.20.2 shwsun/kube-scheduler:v1.20.2
# sudo docker tag k8s.gcr.io/kube-controller-manager:v1.20.2 shwsun/kube-controller-manager:v1.20.2
# sudo docker tag k8s.gcr.io/pause:3.2 shwsun/pause:3.2
# sudo docker tag k8s.gcr.io/etcd:3.4.13-0 shwsun/etcd:3.4.13-0
# sudo docker tag k8s.gcr.io/coredns:1.7.0 shwsun/coredns:1.7.0

# sudo docker push shwsun/kube-proxy:v1.20.2
# sudo docker push shwsun/kube-apiserver:v1.20.2
# sudo docker push shwsun/kube-scheduler:v1.20.2
# sudo docker push shwsun/kube-controller-manager:v1.20.2
# sudo docker push shwsun/pause:3.2
# sudo docker push shwsun/etcd:3.4.13-0
# sudo docker push shwsun/coredns:1.7.0

export HOME=/home/vagrant
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown vagrant:vagrant $HOME/.kube/config 
#sudo chown $(id -u):$(id -g) $HOME/.kube/config 
#kubectl get nodes
#kubectl get pods -A 

# web UI 
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
