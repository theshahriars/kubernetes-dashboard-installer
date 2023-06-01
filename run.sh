kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

kubectl apply -f dashboard-deployment.yml

kubectl apply -f dashboard-service-account-user.yml

kubectl apply -f dashboard-rbac-cluster-role-binding.yml