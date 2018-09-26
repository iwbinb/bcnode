#!/bin/sh
docker run --restart unless-stopped --name bcnode -d --cpus 0.75 -p 3000:3000 -p 16061:16061 -p 16060:16060 -e BC_DISCOVERY_MDNS=‘true’ blockcollider/bcnode:0.8.2 start --ws --rovers --ui --node --miner-key 0x752c2f42dff1c69a1275cae45b404fc182fa6331
