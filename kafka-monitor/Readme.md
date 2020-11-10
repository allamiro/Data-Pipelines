# Kafka Monitoring with Grafana 
![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/image.png)
An open source project to develop a monitoring system for kafka based on grafana telegram and influxdb


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
```

## Start the server

```
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
systemctl enable grafana-server
```



## Configure Grafana






## Install InfluxDB



## Connect Grafana to InfluxDB 





## Install Telegraf on the KAFKA Server or Kafka Cluster 





## Configure Jolokia 

















