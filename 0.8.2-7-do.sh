#!/bin/sh

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
systemctl start docker
docker run --restart unless-stopped --name bcnode -d --cpus 0.75 -p 3000:3000 -p 16061:16061 -p 16060:16060 -e BC_DISCOVERY_MDNS=‘true’ blockcollider/bcnode:0.8.2 start --ws --rovers --ui --node --miner-key 0x7b353d4b225ffde296163472ac639d86b77b55fc
