docker run -p 3306:3306  -v $PWD/data/mysql:/var/lib/mysql --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql

将运行中的mysql镜像数据信息拷贝出来
docker cp mysql.5.5:/var/lib/mysql /var/own/mysqldata