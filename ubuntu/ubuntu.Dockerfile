# PLATFORMS: linux/amd64 linux/arm64 linux/ppc64le linux/s390x linux/riscv64
FROM docker.io/stabletec/build-core:ubuntu

RUN apt update \
    && apt install -y \
    # Dependencies
    catch2 glslang-tools libassimp-dev libbullet-dev libevent-dev libfmt-dev libfreeimage-dev \
    libglfw3-dev libglm-dev libopenxr-dev libsodium-dev libvulkan-dev libyaml-cpp-dev \
    # Vulkan
    $(if [ `uname -m` != "riscv64" ]; then echo "mesa-vulkan-drivers"; fi) vulkan-tools vulkan-validationlayers \
    # Other
    curl \
    && apt clean all
