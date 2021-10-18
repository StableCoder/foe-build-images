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
    libyaml-cpp-dev \
    && apt clean all

RUN git clone --branch release-1.0.16 https://github.com/KhronosGroup/OpenXR-SDK \
    && cmake OpenXR-SDK -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -BOpenXR-SDK/build \
    && ninja -COpenXR-SDK/build \
    && ninja -COpenXR-SDK/build install
