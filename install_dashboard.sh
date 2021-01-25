# API Server 이용해 연결하는 방법
# http://192.168.56.10:8001/api 로 https가 아닌 http 8001 API 로 호출.

#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
export HOME=/home/vagrant
kubectl apply -f $HOME/yml/kube-dashboard.yml
# "연결이 비공개로... " 에러. 권한 설정 필요. 
# Creating a Service Account
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF
# cat <<EOF | kubectl apply -f -
# apiVersion: v1
# kind: ServiceAccount
# metadata:
#   name: admin-user
#   namespace: kubernetes-dashboard
# EOF
# Creating a ClusterRoleBinding
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: kubernetes-dashboard
  namespace: kubernetes-dashboard
EOF
# cat <<EOF | kubectl apply -f -
# apiVersion: rbac.authorization.k8s.io/v1
# kind: ClusterRoleBinding
# metadata:
#   name: admin-user
# roleRef:
#   apiGroup: rbac.authorization.k8s.io
#   kind: ClusterRole
#   name: cluster-admin
# subjects:
# - kind: ServiceAccount
#   name: admin-user
#   namespace: kubernetes-dashboard
# EOF

# bearer token : http 일 때 사용 안 됨 확인.
# kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
echo "http://192.168.56.10:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
kubectl proxy --address 0.0.0.0 --accept-hosts '.*'
# https://192.168.56.10:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
# http://192.168.56.10:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

# 바인딩 포트 확인
# kubectl -n kube-system get service kubernetes-dashboard
# kubectl -n kubernetes-dashboard get service kubernetes-dashboard-74d688b6bc-qc2rl
# 마스터 IP 알기
# kubectl cluster-info
# # Parse the token
# TOKEN=$(kubectl describe secret $(kubectl -n kubernetes-dashboard get secret | awk '/^cluster-admin-dashboard-sa-token-/{print $1}') | awk '$1=="token:"{print $2}')
# # --enable-skip-login
# kubectl edit deployment/kubernetes-dashboard — namespace=kubernetes-dashboard
