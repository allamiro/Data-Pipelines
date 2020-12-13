#!/bin/bash
# Simple script to install InfluxDB and  Grafana
# Source http://vmkdaily.ghost.io/influxdb-and-grafana-on-centos/


echo "Add InfluxDB  package repo to yum directory "
sleep 2

cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
sleep 2

echo ""
echo "ADD Grafana Packages Repo "
sleep 4
cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packagecloud.io/grafana/stable/el/6/$basearch
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF


echo "Install InfluxDB and Grafana"
sleep 2
sudo yum install influxdb grafana -y
yum install fontconfig -y
yum install freetype* -y
yum install urw-fonts -y

sleep 3

echo "Allow Ports  : If you using aws you will need to edit your inbound and outbound rules policies"
echo""
sleep 4
echo "Firewalld configurations"
sleep 3
firewall-cmd --permanent --zone=public --add-port=8086/tcp
firewall-cmd --permanent --zone=public --add-port=8083/tcp
firewall-cmd --permanent --zone=public --add-port=3000/tcp

firewall-cmd --reload
echo "Firewall Configurations Completed"
sleep 3
echo "ENable and start influx DB and Grafana "
sleep 4
systemctl daemon-reload

systemctl enable influxdb.service
systemctl start influxdb.service

sudo systemctl enable grafana-server.service
sudo systemctl start grafana-server.service


###
echo "FluentD td agent installation"
sleep 4


curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh


sudo systemctl start td-agent.service
sudo systemctl status td-agent.service
sudo systemctl enable td-agent.service



/usr/sbin/td-agent-gem install fluent-plugin-influxdb
