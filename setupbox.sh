#!/bin/sh

#install golang
#sudo wget https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz >/dev/null 2>&1
sudo tar -zxvf go1.9.linux-amd64.tar.gz
sudo mv go /usr/local

#install git
sudo apt-get -y install git

#install couchbase
#curl -O http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-3-amd64.deb 
sudo dpkg -i couchbase-release-1.0-3-amd64.deb
sudo apt-get update
sudo apt-get install -y --force-yes couchbase-server
#sudo apt-get install -y couchbase-server-community

