#!/bin/bash -e
curl -s -X DELETE "http://localhost:8983/api/cluster/configs/myConfigSet?omitHeader=true"
