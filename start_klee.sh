#!/bin/bash


HOST_PROJECT_DIR="/c/Users/mooka/klee-triangle"

# Docker image name
IMAGE_NAME="klee/klee"

# Container name
CONTAINER_NAME="klee-triangle-container"

# Check if container exists and is running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Starting existing container $CONTAINER_NAME..."
    docker start $CONTAINER_NAME
elif [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Container exists but stopped. Starting $CONTAINER_NAME..."
    docker start $CONTAINER_NAME
else
    echo "Creating and starting new container $CONTAINER_NAME..."
    docker run -dit --name $CONTAINER_NAME -v "$HOST_PROJECT_DIR:/home/klee/klee-triangle" $IMAGE_NAME
fi

# Attach to container bash shell
echo "Opening bash shell inside $CONTAINER_NAME..."
docker exec -it $CONTAINER_NAME bash -c "
cd /home/klee/klee-triangle && \
clang -fprofile-arcs -ftest-coverage -g triangle_replay.c test_runner.c -o test_runner && \
echo 'Compilation done. You can now run ./replay_klee.sh' && \
exec bash
"
