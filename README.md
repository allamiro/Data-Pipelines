# Setup One KAFKA Broker

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-onebroker.PNG)


### Install JAVA 

```
yum install java -y
java -version
```







# Setup kafka  Cluster 

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-cluster.PNG)


## On Each Server

### Install JAVA 

```
yum install java -y
java -version
```

### Download Kafka and Zookeeper

On each server KFK1, KFK2 , KFK3 download Kafka and Zokeeper to the tmp directory 

```
cd /tmp
wget https://downloads.apache.org/zookeeper/stable/apache-zookeeper-3.5.8-bin.tar.gz
wget https://downloads.apache.org/kafka/2.6.0/kafka_2.13-2.6.0.tgz

```

On each server extract the Kafka archive file 

```

tar -xzvf kafka_2.13-2.6.0.tgz

```


### Configure Zookeeper


```
mv kafka_2.13-2.6.0 /etc/kafka

mkdir -p /var/lib/zookeeper/
```

Update Zookeeper properties file on every server

```
cat <<EOF | sudo tee /etc/kafka/config/zookeeper.properties
tickTime=2000
dataDir=/var/lib/zookeeper
clientPort=2181
initLimit=5
syncLimit=2
server.1=kfk1:2888:3888
server.2=kfk2:2888:3888
server.3=kfk3:2888:3888
EOF
```


Add Firewall rules

```
firewall-cmd --permanent --add-port=2181/tcp
firewall-cmd --reload
```

Create Zookeeper Service file 

```
```


Start Zookeeper Service

```
```












