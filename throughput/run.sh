#!/bin/bash

docker run -dit --privileged --name cmpe202-jackson-throughput-container chrishan82/cmpe202-jackson-throughput

docker exec cmpe202-vanilla-music-latency-container /bin/sh -c "wget https://raw.githubusercontent.com/ZiyeHan/CMPS-202/master/throughput/test.sh"
docker exec cmpe202-vanilla-music-latency-container /bin/sh -c "bash test.sh"
