# Kafka Monitoring with Grafana 
An open source project to develop a monitoring system for kafka based on grafana telegram and influxdb.

![alt text](https://github.com/allamiro/KAFKA/blob/master/kafka-monitor/image.png)



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

## Connect Grafana to InfluxDB 





## Install Telegraf on the KAFKA Server or Kafka Cluster 





## Configure Jolokia 

















