#!/bin/bash

cmd="docker exec vanilla-container /bin/sh -c"

docker stop vanilla-container
docker rm vanilla-container
docker run -dit --privileged --name vanilla-container vanillaMusicLatencyServer

# results are html files
