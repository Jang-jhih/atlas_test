docker run --name mysql \
  -p 3306:3306 \
  -v /mnt/mysql-data:/var/lib/mysql \
  -v /mnt/mysql-config:/etc/mysql/conf.d \
  -e MYSQL_ROOT_PASSWORD=password \
  -d mysql

docker stop $(docker ps -aq) 
docker rm $(docker ps -aq) 
docker rmi $(docker images -q)

docker run -v ${PWD}:/code -w /code -it ubuntu:20.04 bash