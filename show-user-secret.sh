
echo "Username: $(kubectl get secret $1 -o 'jsonpath={.data.username}' | base64 -d)"
echo "Password: $(kubectl get secret $1 -o 'jsonpath={.data.password}' | base64 -d)"
