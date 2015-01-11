LINK=""
for i in {1..3}
do
    HOST=hdw-001-0$i
    LINK="$LINK --link=$HOST:$HOST"
    sudo docker run --name=$HOST -h $HOST -p 1000$i:22 -p 1920$i:9200 -d sktelecom/ubuntu14.10-hdw /root/start.sh
done

HOST=hnn-001-01
PORT="-p 10000:22 -p 50070:50070 -p 8088:8088 -p 26080:26080 -p 8888:8888"
sudo docker run --name=$HOST -h $HOST $PORT $LINK -it --rm sktelecom/ubuntu14.10-hdw /root/init-nn.sh

for i in {1..3}
do
    sudo docker rm -f hdw-001-0$i
done
