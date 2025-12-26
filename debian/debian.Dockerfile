# PLATFORMS: linux/amd64 linux/arm64 linux/ppc64le linux/s390x linux/riscv64
FROM docker.io/stabletec/build-core:debian

RUN apt update \
    && apt install -y \
    # Dependencies
    glslang-tools libassimp-dev libbullet-dev libcatch2-dev libevent-dev  \
    libfmt-dev libglfw3-dev libglm-dev libmagickcore-dev libopenxr-dev \
    libsdl3-dev libsodium-dev libvulkan-dev libyaml-cpp-dev \
    # Vulkan
    mesa-vulkan-drivers vulkan-tools vulkan-validationlayers \
    # Other
    curl \
    && apt clean all
