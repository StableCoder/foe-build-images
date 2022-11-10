FROM docker.io/stabletec/build-core:opensuse

RUN zypper install -y \
    # Dependencies
    assimp-devel libbullet-devel Catch2-devel fmt-devel freeimage-devel \
    libglfw-devel glm-devel glslang-devel vulkan-devel yaml-cpp-devel \
    # Vulkan
    $(if [ `uname -m` == "amd64" ]; then echo "libvulkan_intel libvulkan_lvp libvulkan_radeon"; fi) vulkan-validationlayers \
    && zypper clean --all

RUN git clone --branch release-1.0.25 https://github.com/KhronosGroup/OpenXR-SDK \
    && cmake OpenXR-SDK -GNinja -BOpenXR-SDK/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_WITH_WAYLAND_HEADERS=OFF \
    && ninja -COpenXR-SDK/build \
    && ninja -COpenXR-SDK/build install \
    && rm -rf OpenXR-SDK