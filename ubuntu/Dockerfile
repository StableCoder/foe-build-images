FROM stabletec/build-core:ubuntu

RUN apt install -y \
    glslang-tools \
    libassimp-dev \
    libvulkan-dev \
    libglfw3-dev \
    libglm-dev \
    libfmt-dev  \
    libyaml-cpp-dev \
    && apt clean all

RUN git clone --branch release-1.0.13 https://github.com/KhronosGroup/OpenXR-SDK \
    && cmake OpenXR-SDK -GNinja -DCMAKE_BUILD_TYPE=Release -BOpenXR-SDK/build \
    && ninja -COpenXR-SDK/build \
    && ninja -COpenXR-SDK/build install