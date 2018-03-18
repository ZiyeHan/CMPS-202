#!/bin/bash

docker run -dit --privileged --name cmpe202-vanilla-music-latency-container chrishan82/cmpe202-vanilla-music-latency

docker exec cmpe202-vanilla-music-latency-container /bin/sh -c "wget "







