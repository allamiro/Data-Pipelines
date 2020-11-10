# Kafka Monitoring with Grafana 
An open source project to develop a monitoring system for kafka based on grafana telegram and influxdb


# Install Grafana and Influx DB 




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


# 
```
sudo yum install grafana -y
```

















