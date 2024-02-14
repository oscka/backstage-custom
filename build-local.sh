# vi build-local.sh
echo "--------------------------------------------";
echo "Build Start";
echo "--------------------------------------------";

yarn clean

yarn install

yarn build:backend --config ../../app-config.yaml

echo "--------------------------------------------";
echo "Build Docker Image Start";
echo "--------------------------------------------";

docker login docker.openmsa.monster -u admin -p osckorea!

docker build . -t docker.openmsa.monster/backstage

echo "--------------------------------------------";
echo "Push Docker Image Start";
echo "--------------------------------------------";
docker push docker.openmsa.monster/backstage