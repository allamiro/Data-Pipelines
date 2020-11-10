# Kafka Monitoring with Grafana 
An open source project to develop a monitoring system for kafka based on grafana telegram and influxdb.

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/kafka-monitor-pipeline-grafana.PNG)



# Setup Grafana and Influx DB  Monitoring Server


## Create grafana repo file 

```
cat <<-EOF > /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
```


##  Install Grafana 
```
yum install grafana -y
yum install initscripts urw-fonts wget -y
yum install fontconfig -y
yum install freetype* -y
yum install urw-fonts -y
```
## Add firewall rule to allow for Grafana port 3000

Please note if you have configured port forwarding , https, and proxy services you may need to adjust the rule accordingly
```
firewall-cmd --permanent --add-port=3000/tcp
firewall-cmd --reload
```
## Start the server

```
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
systemctl enable grafana-server
```



## Configure Grafana

Open your browser and navigate to your grafana  system using the ip or the hotname setup earlier 
and use the default  username admin/admin the system will prompt you to change the password.

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/grafana-7login.PNG)




## Install InfluxDB
Create InfluxDB repo file 
```
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
```

```
yum install influxdb -y
```
Start the influxDB server

```
sudo systemctl start influxdb
systemctl status influxdb
systemctl enable influxdb
```



## Configure InfluxDB 
create influxDB database username and permissions

1. Create the DB account 
```
[root@grafana yum.repos.d]# influx
Connected to http://localhost:8086 version 1.8.3
InfluxDB shell version: 1.8.3
> CREATE USER kafka WITH PASSWORD 'kafka' WITH ALL PRIVILEGES
> SHOW USERS
user  admin
----  -----
kafka true

```
2. Create InfluxDB database for kafka monitoring
```
CREATE DATABASE "kafkamonitordb"
GRANT ALL ON "kafkamonitordb" TO "kafka"
```

```
> show databases
name: databases
name
----
_internal
kafkamonitordb
>
```


## Connect Grafana to InfluxDB 
Please note:
Installation of the InfluxDB package may require root or administrator privileges in order to complete successfully.
InfluxDB OSS networking ports
By default, InfluxDB uses the following network ports:

```
TCP port 8086 is available for client-server communication using the InfluxDB API.
TCP port 8088 is available for the RPC service to perform back up and restore operations.
```
### Add influxDB data source to grafana

In the left menu, click on the Configuration > Data sources section.
choose InfluxDB as a datasource.

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/add-influxdb-datasource.PNG)



![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/add-db1.PNG)


![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/add-db2.PNG)

Click on Save and Test  and if every thing is working you will see the message Data source is working

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/working-datasourceinfluxdb.PNG)

```
Please note if you using a sepearate server for your
database you may need to update your network firewall and server firewall to allow
grafana to access port 8086 or your influxdb port
```

## Install Telegraf on the KAFKA Server or Kafka Cluster 

1. Create Telegraf repo file 

```
cat <<EOF | sudo tee /etc/yum.repos.d/telegraf.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
```
2. Install Telegraf 
```
yum install telegraf -y

```

3. Configure Telegraf 

Configure Telegraf to send some metrics to test connection to the influxdb and grafana server

```
vim /etc/telegraf/telegraf.conf
```





4. Start the influxDB server

```

sudo systemctl start telegraf
systemctl status telegraf
systemctl enable telegraf

```


## Configure Jolokia 






## Configure Telegraf to read Kafka Metrics

Update telegraf with KAFKA metrics




## Create Grafana KAFKA monitoring Dashabords 






## Disclaimer
This repository also contains a few assets that are not my own works and are stored here for data archival purposes only.So please  do not use any of the resources listed above in a way that would violate the copyright of their creators.





## Maintainer 









