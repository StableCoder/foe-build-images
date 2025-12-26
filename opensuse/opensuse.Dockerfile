# PLATFORMS: linux/amd64 linux/arm64 linux/ppc64le
FROM docker.io/stabletec/build-core:opensuse

RUN zypper install -y \
    # Dependencies
    assimp-devel \
    Catch2-devel \
    fmt-devel \
    glm-devel \
    glslang-devel \
    ImageMagick-devel \
    libbullet-devel  \
    libevent-devel \
    libglfw-devel \
    libsodium-devel \
    vulkan-devel \
    yaml-cpp-devel \
    # Vulkan
    $(if [ `uname -m` == "amd64" ]; then echo "libvulkan_intel libvulkan_lvp libvulkan_radeon"; fi) vulkan-tools vulkan-validationlayers \
    # Other
    curl tar gzip \
    && zypper clean --all

# OpenXR SDK
RUN git clone --branch release-1.1.54 https://github.com/KhronosGroup/OpenXR-SDK \
    && cmake OpenXR-SDK -GNinja -BOpenXR-SDK/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_WAYLAND_HEADERS=OFF \
    && ninja -COpenXR-SDK/build \
    && ninja -COpenXR-SDK/build install \
    && rm -rf OpenXR-SDK
