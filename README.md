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
# cd /tmp
# wget https://downloads.apache.org/zookeeper/stable/apache-zookeeper-3.5.8-bin.tar.gz
# wget https://downloads.apache.org/kafka/2.6.0/kafka_2.13-2.6.0.tgz

```

On each server extract the Kafka archive file 

```

tar -xzvf kafka_2.13-2.6.0.tgz

```


### Configure Zookeeper




















