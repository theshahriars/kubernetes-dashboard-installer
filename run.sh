kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

kubectl apply -f dashboard-deployment.yml

kubectl apply -f dashboard-service-account-user.yml

kubectl apply -f dashboard-rbac-cluster-role-binding.yml

kubectl create clusterrolebinding kubernetes-dashboard-admin --clusterrole=admin --serviceaccount=kubernetes-dashboard:admin-user

export DASH_NODE_NAME=`kubectl get pods  --all-namespaces -o wide | grep "kubernetes-dashboard-" | awk {'print $8'}`
export DASH_NODE_IP=`grep $DASH_NODE_NAME /etc/hosts | awk {'print $1'}`
export DASH_NODE_PORT=` kubectl get services  --all-namespaces -o wide | grep "443:" | awk {'print $6'} | sed  's/443//' | sed 's/\/TCP//'`

echo "Your Dashboard with Nodeport URL is: https://$DASH_NODE_IP$DASH_NODE_PORT/"
echo
echo
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')