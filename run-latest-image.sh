#!/bin/bash
docker run -P -i -t $(docker images | head -n 2 | tail -n 1 | awk '{ print $3 }') /bin/bash -ic 'tail -n 1 /var/log/blazegraph/blazegraph.log'
