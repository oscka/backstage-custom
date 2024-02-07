# vi build-local.ps1
Write-Host "--------------------------------------------";
Write-Host "Build Start";
Write-Host "--------------------------------------------";

yarn clean

yarn install

yarn build:backend --config ../../app-config.yaml

Write-Host "--------------------------------------------";
Write-Host "Build Docker Image Start";
Write-Host "--------------------------------------------";

docker login docker.openmsa.monster -u admin -p osckorea!

docker build . -t docker.openmsa.monster/backstage

Write-Host "--------------------------------------------";
Write-Host "Push Docker Image Start";
Write-Host "--------------------------------------------";
docker push docker.openmsa.monster/backstage