docker stop postgres1 || true && docker rm postgres1 || true
docker stop goapp1 || true && docker rm goapp1 || true

docker build -t go GOApplication

docker build -t pg PostgreSQL

docker run --name postgres1 -it -d pg

sleep 5

docker run --name goapp1 --link postgres1:db go go test

sleep 5

docker stop postgres1
docker stop goapp1
docker rm postgres1
docker rm goapp1
