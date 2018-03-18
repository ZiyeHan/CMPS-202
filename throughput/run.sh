#!/bin/bash

cmd="docker exec jackson-container /bin/sh -c"

docker stop jackson-container
docker rm jackson-container
docker run -dit --privileged --name jackson-container JacksonThroughputServer

# results are png files
