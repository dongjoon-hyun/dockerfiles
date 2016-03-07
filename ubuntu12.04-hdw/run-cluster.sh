LINK=""
for i in {1..3}
do
    HOST=hdw-001-0$i
    LINK="$LINK --link=$HOST:$HOST"
    docker run --name=$HOST -h $HOST -p 1001$i:22 -p 1920$i:9200 -d dongjoon/ubuntu12.04-hdw /root/start.sh
done

HOST=hnn-001-01
PORT="-p 8088:8088 -p 8888:8888 -p 10000:10000 -p 10010:22 -p 26002:26002 -p 26080:26080 -p 50070:50070"
docker run --name=$HOST -h $HOST $PORT $LINK -it --rm dongjoon/ubuntu12.04-hdw /root/init-nn.sh

for i in {1..3}
do
    docker rm -f hdw-001-0$i
done
