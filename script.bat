echo "Inicando imagens..."

docker build -t tonelotti/projeto-kubernetes-backend:1.0 backend/.
docker build -t tonelotti/projeto-kubernetes-database:1.0 database/.

echo "subindo as imagens"

docker push tonelotti/projeto-kubernetes-backend:1.0
docker push tonelotti/projeto-kubernetes-database:1.0

echo "Criando serviços cluster Kubernetes"

kubectl.exe apply -f ./services.yml

echo "Criando os deployments"

kubectl.exe apply -f ./deployment.yml