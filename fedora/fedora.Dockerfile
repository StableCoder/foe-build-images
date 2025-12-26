# PLATFORMS: linux/amd64 linux/arm64 linux/ppc64le linux/s390x
FROM docker.io/stabletec/build-core:fedora

RUN dnf install -y \
    # Dependencies
    assimp-devel bullet-devel catch-devel fmt-devel glfw-devel \
    glm-devel glslang libevent-devel ImageMagick-devel openxr-devel \
    SDL3-devel libsodium-devel vulkan-devel yaml-cpp-devel  \
    # Vulkan
    mesa-vulkan-drivers vulkan-tools vulkan-validation-layers \
    # Other
    python3-pip python3-autopep8 shfmt \
    && dnf clean all

RUN pip3 install cmake-format[yaml]
