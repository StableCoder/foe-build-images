FROM docker.io/stabletec/build-core:opensuse

RUN zypper install -y \
    assimp-devel \
    libbullet-devel \
    Catch2-devel \
    fmt-devel \
    freeimage-devel \
    libglfw-devel \
    glm-devel \
    glslang-devel \
    vulkan-devel \
    yaml-cpp-devel \
    && zypper clean --all

RUN git clone --branch release-1.0.20 https://github.com/KhronosGroup/OpenXR-SDK \
    && cmake OpenXR-SDK -GNinja -BOpenXR-SDK/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_WAYLAND_HEADERS=OFF \
    && ninja -COpenXR-SDK/build \
    && ninja -COpenXR-SDK/build install