export HOME=/home/vagrant
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
# sudo docker login -u shwsun -p 0654Tjs!
# sudo docker tag quay.io/coreos/flannel:v0.13.1-rc1 shwsun/flannel:v0.13.1-rc1
# sudo docker push shwsun/flannel:v0.13.1-rc1 
# 
kubectl apply -f $HOME/yml/kube-flannel.yml
# master 에 걸린 스케줄 제한 taint 해제
# kubectl taint nodes {해제할 노드 이름} node-role.kubernetes.io/master-
kubectl taint nodes k8s node-role.kubernetes.io/master-
# 해제한 taint 다시 복원
#kubectl taint nodes {설정할 노드 이름} node-role.kubernetes.io=master:NoSchedule

# 테스트용 출력
kubectl get pods -A
