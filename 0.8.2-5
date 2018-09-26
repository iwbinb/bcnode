#!/bin/sh
docker run --restart unless-stopped --name bcnode -d --cpus 0.75 -p 3000:3000 -p 16061:16061 -p 16060:16060 -e BC_DISCOVERY_MDNS=‘true’ blockcollider/bcnode:0.8.2 start --ws --rovers --ui --node --miner-key 0x6be985e15a1652621f715b4fbffad05f4b4638b8
