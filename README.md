# docker-image-haproxy-redis

#### This project is for the docker image of haproxy for redis

<pre><code>$>docker run -d --name haproxy-redis --link redis-master --link redis-slave01 --link redis-slave02 -p 7777:7777 kilsoo75/haproxy-redis
$>docker run -d --name haproxy-redis --link redis-master --link redis-slave01 --link redis-slave02 -e MASTER_PASSWORD=mypwd -p 7777:7777 kilsoo75/haproxy-redis</code></pre>

