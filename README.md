# Dockerized COLMAP 

Dockerfile to create a Docker container with the [COLMAP](https://colmap.github.io) executables.

The container is hosted on [Docker Hub](https://hub.docker.com/r/ganders/colmap/). To use it, simply execute

    docker run --rm -v $PROJECT_PATH:/project ganders/colmap automatic_reconstruction --project_path /project --image_path /project/images 

See the COLMAP documentation for instructions on how to use the COLMAP executables.
