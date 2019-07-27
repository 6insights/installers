#!/bin/bash
useradd -s /sbin/nologin prometheus
cd /home/prometheus/ 
mkdir -p prometheus /d01/prometheus-data
wget https://github.com/prometheus/prometheus/releases/download/v2.11.1/prometheus-2.11.1.linux-amd64.tar.gz
tar -zxf prometheus-2.11.1.linux-amd64.tar.gz && rm -rf prometheus-2.11.1.linux-amd64.tar.gz
mv prometheus-2.11.1.linux-amd64 prometheus
echo "[Unit]" > /etc/systemd/system/prometheus.service
echo "Description=Prometheus" >> /etc/systemd/system/prometheus.service
echo "[Service]" >> /etc/systemd/system/prometheus.service
echo "ExecStart=/home/prometheus/prometheus/prometheus --config.file=/home/prometheus/prometheus/prometheus.yml --storage.tsdb.path=/d01/prometheus-data" >> /etc/systemd/system/prometheus.service
echo "[Install]" >> /etc/systemd/system/prometheus.service
echo "WantedBy=default.target" >> /etc/systemd/system/prometheus.service
systemctl daemon-reload
systemctl enable prometheus.service
systemctl start prometheus.service
systemctl restart prometheus.service