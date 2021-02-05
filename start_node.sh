sudo swapoff -a

# # overwrite kube config as admin 
export HOME=/home/vagrant
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# # #sudo chown $(id -u):$(id -g) $HOME/.kube/config
# sudo chown vagrant:vagrant $HOME/.kube/config

# pod 통신 위한 network 설정
# pod network 설치. 임시.
sudo docker login -u shwsun -p 0654Tjs!
sudo docker pull shwsun/flannel:v0.13.1-rc1
sudo docker image tag shwsun/flannel:v0.13.1-rc1  quay.io/coreos/flannel:v0.13.1-rc1
sudo docker image rm -f shwsun/flannel:v0.13.1-rc1
#kubectl apply -f  $HOME/yml/kube-flannel.yml

# master init 시 출력된 token 으로 대체
export TOKEN=44m46x.9w9zpqbtup8smzgi
export CERT-HASH=sha256:76657d843c1147f94ff76c9ff39585746668761bf9a67316f535f5d9067c9531
sudo kubeadm join 192.168.56.10:6443 --token ${TOKEN} --discovery-token-ca-cert-hash ${CERT-HASH}



