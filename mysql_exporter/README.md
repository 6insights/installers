# MySQL Exporter Installer

## Usage

> On MYSQL Run :
    CREATE USER 'mysqld_exporter'@'localhost' IDENTIFIED BY 'sample_password' WITH MAX_USER_CONNECTIONS 3;
    GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld_exporter'@'localhost';
> On Shell Run :
    sh MySQL_exporter_installation.sh

## OS
   Centos
   
## Changes 
    You can change Username and password in both MySQL_exporter_installation.sh and MYSQL command as per your need.