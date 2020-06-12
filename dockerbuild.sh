echo "Stopping containers"
docker stop csv
docker stop st
docker stop yml

echo "Containers stopped"
VERSION=0.3
CLOWDER_URL=34.106.253.53

echo "Build containers"
docker build --build-arg clowder_url=$CLOWDER_URL --tag csv:$VERSION ./csv
docker build --build-arg clowder_url=$CLOWDER_URL --tag st:$VERSION ./st
docker build --build-arg clowder_url=$CLOWDER_URL --tag yml:$VERSION ./yml


docker rm csv
docker rm st
docker rm yml

echo "Run Containers"
docker run -d --name csv csv:$VERSION
docker run -d --name st st:$VERSION
docker run -d --name yml yml:$VERSION

