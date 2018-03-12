#!/bin/bash

cmd="docker exec vanilla-container /bin/sh -c"

docker stop vanilla-container
docker rm vanilla-container
docker run -dit --privileged --name vanilla-container vanillaMusicLatencyServer

$cmd "cd latency/ && ./latency"
$cmd "cd latency/ && Rscript dnorm.R"

