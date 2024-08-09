#!/bin/bash

# This script starts a Docker container with user-specified mount path and hostname.

# Check if the correct number of arguments are passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <mount-path> <root-drive> <hostname>"
    exit 1
fi

# Assigning arguments to variables
MOUNT_PATH=$1
HOSTNAME=$3
ROOT_DRIVE=$2
DOCKER_MNT_PATH="/mnt/thor-mnt/"
DOCKER_HOSTNAME="thor"
DOCKER_NAME="thor"

# Get current time in the specified format
CURRENT_TIME=$(date +"%Y-%m-%d-%H-%M-%S")

# Command to run the Docker container
sudo docker run -it --rm \
    -v "${MOUNT_PATH}:${DOCKER_MNT_PATH}" \
    -v /thor-reports/:/reports/ \
    --hostname ${DOCKER_HOSTNAME} \
    ${DOCKER_NAME} --lab \
    --virtual-map "${DOCKER_MNT_PATH}:${ROOT_DRIVE}" \
    -j ${HOSTNAME} \
    -p ${DOCKER_MNT_PATH} \
    -e /reports/ \
    --jsonv2 \
    --jsonfile ${CURRENT_TIME}-${HOSTNAME}-thor.json