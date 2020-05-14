#!/bin/bash

curl -sSL https://get.docker.com | sh && \
  apt install -y libffi-dev libssl-dev python3 python3-pip && apt remove python-configparser && \
  pip3 install docker-compose;
