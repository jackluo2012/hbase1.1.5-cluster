#!/bin/bash
# the default node number is 3
#sudo docker rm $(docker ps -a) &> /dev/null
N=${1:-5}
# start hadoop hbase container
i=1
while [ $i -lt $N ]
do
	sudo docker stop hadoop-hbase-$i > /dev/null 2>&1
	sudo docker rm  hadoop-hbase-$i > /dev/null 2>&1
	echo "start hadoop-hbase-$i container..."
	sudo docker run -td \
	                --net=hadoop \
			-p 1601$i:16010 \
	                --name hadoop-hbase-$i \
	                --hostname hadoop-hbase-$i \
	                jackluo/hbase:1.1.5 > /dev/null 2>&1
	i=$(( $i + 1 ))
done 

# get into hadoop master container

echo "在hadoop-hbase-1上面执行,它会发ssh到其它上面去..."
sudo docker exec -it hadoop-hbase-1 start-hbase.sh
echo "...完成..."

echo "在hbase上面弄一个主从..."
sudo docker exec -it hadoop-hbase-2 hbase-daemon.sh start master
echo "...完成..."

sudo docker exec -it hadoop-hbase-1 /bin/bash




