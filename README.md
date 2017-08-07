# docker-image-haproxy-redis
This project is for the docker image of haproxy for redis

$>docker run -d --name haproxy-redis --link redis-master01 --link redis-slave01 --link redis-slave02 kilsoo75/haproxy-redis
