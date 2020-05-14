#!/bin/bash -e

ROOTPATH=$(pwd)
docker build -t ecell4_docs ${ROOTPATH}
docker run --device /dev/fuse --cap-add SYS_ADMIN --rm -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) --mount type=bind,src=${ROOTPATH}/artifacts,dst=/artifacts -it ecell4_docs:latest
