#!/bin/bash

function check_and_push() {
    local IMAGE_NAME="$1"
    local TAG="$2"
    local FOLDER="$3"

    if ! docker manifest inspect "$IMAGE_NAME:$TAG" >/dev/null 2>&1; then
        echo "Tag $TAG does not exist for $IMAGE_NAME. \n\tBuilding image..."
        docker build -q -t $IMAGE_NAME:$TAG $FOLDER
        docker build -q -t $IMAGE_NAME:latest $FOLDER

        echo "\t pushing image $IMAGE_NAME:$TAG"
        docker push -q "$IMAGE_NAME:$TAG"
        docker push -q "$IMAGE_NAME:latest"
    else
        echo "Tag $TAG already exists for $IMAGE_NAME. Doing nothing."
    fi
}

DOCKER_HUB_ACCOUNT=$DOCKER_HUB_USERNAME
PUSH_DIR=$(ls -d */ | grep -v 'thor\|dev' | sed 's/\///g')

for FOLDER in $PUSH_DIR; do
        TAG=$(sha256sum $FOLDER/Dockerfile | awk '{print substr($1,1,3) substr($1,length($1)-2)}')
        IMAGE_NAME="$DOCKER_HUB_ACCOUNT/$FOLDER"
        check_and_push $IMAGE_NAME $TAG $FOLDER

done

