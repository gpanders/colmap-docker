FROM nvidia/cuda 

RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libboost-all-dev \
    libsuitesparse-dev \
    libfreeimage-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libglew-dev \
    freeglut3-dev \
    qt5-default \
    libxmu-dev \
    libxi-dev \
    libatlas-base-dev \
    libsuitesparse-dev \
  && rm -rf /var/lib/apt/lists/*

# Install Eigen 3.2.10
COPY eigen /src/eigen
RUN mkdir -p /src/eigen/build
WORKDIR /src/eigen/build
RUN cmake .. && make && make install && make clean

# Install Ceres Solver
COPY ceres-solver /src/ceres-solver
RUN mkdir -p /src/ceres-solver/build
WORKDIR /src/ceres-solver/build
RUN cmake -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF .. && make && make install && make clean 

# Install Colmap
COPY colmap /src/colmap
RUN mkdir -p /src/colmap/build
WORKDIR /src/colmap/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DTESTS_ENABLED=OFF .. && make && make install && make clean

# Delete GUI executable
RUN rm /usr/local/bin/colmap

# Remove unnecessary packages
RUN apt-get purge -y cmake && apt-get autoremove -y

WORKDIR /root

# Delete source files
RUN rm -r /src

ENTRYPOINT /bin/bash
