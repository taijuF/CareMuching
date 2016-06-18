#!/bin/bash
docker build -t rails_api .
docker run -p "3000:3000" rails_api ./docker/docker.sh
