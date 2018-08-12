#!/bin/bash

docker stop pivx-masternode;
docker rm pivx-masternode;

docker run \
  --name pivx-masternode \
  --restart=always \
  -p 51472:51472 \
  -v ~/.pivx:/root/.pivx \
  -d \
  karstenjakobsen/pivx-masternode:3.1.1
