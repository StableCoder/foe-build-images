FROM docker.io/stabletec/build-core:ubuntu

RUN apt update \
    && apt install -y \
    # Dependencies
    glslang-tools libassimp-dev libbullet-dev libvulkan-dev libglfw3-dev \
    libglm-dev libfmt-dev libfreeimage-dev libopenxr-dev libyaml-cpp-dev \
    # Vulkan
    $(if [ `uname -m` != "riscv64" ]; then echo "mesa-vulkan-drivers"; fi) vulkan-validationlayers \
    && apt clean all

