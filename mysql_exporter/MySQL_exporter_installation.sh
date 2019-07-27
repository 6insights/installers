#!/bin/bash
useradd -s /sbin/nologin mysqld_exporter
cd /home/mysqld_exporter/
wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.10.0/mysqld_exporter-0.10.0.linux-amd64.tar.gz
tar -zxf mysqld_exporter-0.10.0.linux-amd64.tar.gz && rm -rf mysqld_exporter-0.10.0.linux-amd64.tar.gz
mv mysqld_exporter-0.10.0.linux-amd64 mysqld_exporter
echo "[client]" > /home/mysqld_exporter/mysqld_exporter/.my.cnf
echo "user=mysqld_exporter" >> /home/mysqld_exporter/mysqld_exporter/.my.cnf
echo "password=sample_password" >> /home/mysqld_exporter/mysqld_exporter/.my.cnf
echo "port=3308" >> /home/mysqld_exporter/mysqld_exporter/.my.cnf
echo "[Unit]" > /etc/systemd/system/mysqld_exporter.service
echo "Description=MySQLD Exporter" >> /etc/systemd/system/mysqld_exporter.service
echo "[Service]" >> /etc/systemd/system/mysqld_exporter.service
echo 'ExecStart=/home/mysqld_exporter/mysqld_exporter/mysqld_exporter -config.my-cnf="/home/mysqld_exporter/mysqld_exporter/.my.cnf" ' >> /etc/systemd/system/mysqld_exporter.service
echo "[Install]" >> /etc/systemd/system/mysqld_exporter.service
echo "WantedBy=default.target" >> /etc/systemd/system/mysqld_exporter.service
systemctl daemon-reload
systemctl enable mysqld_exporter.service
systemctl start mysqld_exporter.service
systemctl status mysqld_exporter.service

