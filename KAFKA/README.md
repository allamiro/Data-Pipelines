# Setup One KAFKA Broker

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-onebroker.PNG)


### Install JAVA 

```
yum install java -y
java -version
```

### Download KAFKA

```
cd /tmp
wget https://downloads.apache.org/kafka/2.6.0/kafka_2.13-2.6.0.tgz

```

Extract the Kafka archive file 

```

tar -xzvf kafka_2.13-2.6.0.tgz

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


Add the following Firewall rules on every server 

```
firewall-cmd --permanent --add-port=2181/tcp
firewall-cmd --add-port=2888-3888/tcp --permanent
firewall-cmd --reload
```
Create the broker id file on every kafka server

```
touch /var/lib/zookeeper/myid
```

### On KFK1
=======
```
cat <<EOF | sudo tee
1
EOF
```
### On KFK2
=======
```
cat <<EOF | sudo tee
2
EOF
```
### On KFK3
=======
```
cat <<EOF | sudo tee
3
EOF
```

Create a Zookeeper Service file on every server

```
cat <<EOF | sudo tee /etc/systemd/system/zoo.service
[Unit]
Description=Zookeeper Service
WantedBy=multi-user.target

[Service]
Type=simple
ExecStart=/etc/kafka/bin/zookeeper-server-start.sh /etc/kafka/config/zookeeper.properties
Restart=always
EOF
```


Start Zookeeper Service

```

systemctl daemon-reload
systemctl start zoo
systemctl status -l zoo
systemctl enable  zoo


```
### Configure KAFKA Brokers 


Update KAFKA properties file on every server

### On KFK1
=======

```
cat <<EOF | sudo tee /etc/kafka/config/server.properties


EOF
```



### On KFK2
=======

```
cat <<EOF | sudo tee /etc/kafka/config/server.properties


EOF
```


### On KFK3
=======

```
cat <<EOF | sudo tee /etc/kafka/config/server.properties


EOF
```


Create a KAFKA Service file on every server


```
cat <<EOF | sudo tee /etc/systemd/system/kafka.service
[Unit]
Description=Kafka Service
WantedBy=multi-user.target

[Service]
Type=simple
ExecStart=/etc/kafka/bin/kafka-server-start.sh /etc/kafka/config/server.properties
Restart=always
EOF
```
Add the following Firewall rules on every server 

```
firewall-cmd --permanent --add-port=9092/tcp
firewall-cmd --reload
```


Start KAFKA Service


```
systemctl daemon-reload
systemctl start kafka
systemctl status -l kafka
systemctl enable  kafka

```

Add KAFKA TOPICS  

The topics that I will be adding 
DB : For Database Server logs
WINDOWS : For Windows Logs
LINUX: FOR LINUX Rsyslog logs
NETWORK: For network devices logs ( Firewall , routers , etc )
APPS: For application logs
IOT : For internet of things devices logs



To Create KAFKA topic 

```
/etc/kafka/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 2 --partitions 3 --topic DB
/etc/kafka/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 2 --partitions 3 --topic IOT
/etc/kafka/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 2 --partitions 3 --topic LINUX
/etc/kafka/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 2 --partitions 3 --topic WINDOWS
/etc/kafka/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 2 --partitions 3 --topic NETWORK
```

To check the replication of your topics 

```
/etc/kafka/bin/kafka-topics.sh --describe --topic WINDOWS  --zookeeper  localhost:2181
OpenJDK 64-Bit Server VM warning: If the number of processors is expected to increase from one, then you should configure the number of parallel GC threads appropriately using -XX:ParallelGCThreads=N
Topic: WINDOWS  PartitionCount: 3       ReplicationFactor: 2    Configs:
        Topic: WINDOWS  Partition: 0    Leader: 3       Replicas: 3,1   Isr: 3,1
        Topic: WINDOWS  Partition: 1    Leader: 1       Replicas: 1,2   Isr: 1,2
        Topic: WINDOWS  Partition: 2    Leader: 2       Replicas: 2,3   Isr: 2,3

```
Start Sending Data to KAFKA 

