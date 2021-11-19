FROM docker.io/stabletec/build-core:debian

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
    libyaml-cpp-dev \
    libopenxr-dev \
    && apt clean all