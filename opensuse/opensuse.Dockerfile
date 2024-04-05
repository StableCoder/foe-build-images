# PLATFORMS: linux/amd64 linux/arm64 linux/ppc64le linux/s390x
FROM docker.io/stabletec/build-core:opensuse

RUN zypper install -y \
    # Dependencies
    assimp-devel fmt-devel freeimage-devel glm-devel glslang-devel libbullet-devel  \
    libevent-devel libglfw-devel libsodium-devel vulkan-devel yaml-cpp-devel \
    # Vulkan
    $(if [ `uname -m` == "amd64" ]; then echo "libvulkan_intel libvulkan_lvp libvulkan_radeon"; fi) vulkan-tools vulkan-validationlayers \
    # Other
    curl tar gzip \
    && zypper clean --all

# OpenXR SDK
RUN git clone --branch release-1.0.28 https://github.com/KhronosGroup/OpenXR-SDK \
    && cmake OpenXR-SDK -GNinja -BOpenXR-SDK/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_WAYLAND_HEADERS=OFF \
    && ninja -COpenXR-SDK/build \
    && ninja -COpenXR-SDK/build install \
    && rm -rf OpenXR-SDK

# Catch 2 (v3)
ENV CATCH2_VER=v3.4.0
RUN curl -o catch2.tar.gz https://codeload.github.com/catchorg/Catch2/tar.gz/refs/tags/${CATCH2_VER} \
        && tar -xf catch2.tar.gz \
        && cd Catch2-* \
        && cmake -B build -G Ninja \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=lib \
                -DCATCH_BUILD_EXAMPLES=OFF \
                -DCATCH_ENABLE_COVERAGE=OFF \
                -DCATCH_ENABLE_WERROR=OFF \
                -DBUILD_TESTING=ON \
        && cmake --build build \
        && cmake --install build \
        && cd .. \
        && rm -rf Catch2-* catch2.tar.gz