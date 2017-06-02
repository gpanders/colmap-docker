# Dockerized COLMAP 

Dockerfile to create a Docker container with the [COLMAP](https://github.com/colmap/colmap) executables.

The container is hosted on [Docker Hub](https://hub.docker.com/r/ganders/colmap/). It is built from a CUDA image, and therefore requires both the [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) plugin and a [CUDA supported graphics card](http://www.geforce.com/hardware/technology/cuda/supported-gpus). To use it, simply execute

    nvidia-docker run --rm -v $PROJECT_PATH:/project ganders/colmap automatic_reconstruction --project_path /project --image_path /project/images 

You must mount a volume to the container using the `-v` flag in order to provide input images to COLMAP as well as to access the output. In the example above, the `$PROJECT_PATH` environment variable should be set to point to a directory on your host computer containing your project files.

See the [COLMAP documentation](https://colmap.github.io) for instructions on how to use the COLMAP executables.
