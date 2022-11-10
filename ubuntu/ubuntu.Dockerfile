FROM docker.io/stabletec/build-core:ubuntu

RUN apt update \
    && apt install -y \
    glslang-tools \
    libassimp-dev \
    libbullet-dev \
    libvulkan-dev \
    libglfw3-dev \
    libglm-dev \
    libfmt-dev \
    libfreeimage-dev \
    libopenxr-dev \
    libyaml-cpp-dev \
    && apt clean all

