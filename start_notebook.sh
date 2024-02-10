#!/bin/bash

# Get the current directory path
CURRENT_DIR=$(pwd)

# Build the Docker image using the Dockerfile in the current directory
docker build -t my_jupyter_image .

# Create a Docker volume for the ipynb files in the current directory
docker volume create --name notebook_volume --opt type=none --opt device="$CURRENT_DIR/notebooks" --opt o=bind

# Run the Docker container with the Jupyter Notebook image and disable login
docker run -d -p 8888:8888 \
           --name my_jupyter_container \
           -v notebook_volume:/app/notebooks \
           my_jupyter_image \
           start-notebook.sh --NotebookApp.token=''
