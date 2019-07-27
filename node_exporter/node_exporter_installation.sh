#!/bin/bash
useradd -s /sbin/nologin node_exporter
cd /home/node_exporter/
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar -zxf node_exporter-0.18.1.linux-amd64.tar.gz
rm -rf node_exporter-0.18.1.linux-amd64.tar.gz
mv node_exporter-0.18.1.linux-amd64 node-exporter
chown -R node_exporter:node_exporter  /home/node_exporter/
echo "[Unit]" > /etc/systemd/system/node_exporter.service
echo "Description=Node Exporter" >> /etc/systemd/system/node_exporter.service
echo "[Service]" >> /etc/systemd/system/node_exporter.service
echo "ExecStart=/home/node_exporter/node-exporter/node_exporter" >> /etc/systemd/system/node_exporter.service
echo "[Install]" >> /etc/systemd/system/node_exporter.service
echo "WantedBy=default.target" >> /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service
systemctl status node_exporter.service