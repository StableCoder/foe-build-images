FROM docker.io/stabletec/build-core:debian

RUN apt update \
    && apt install -y \
    # Dependencies
    glslang-tools libassimp-dev libbullet-dev libvulkan-dev libglfw3-dev \
    libglm-dev libfmt-dev libfreeimage-dev libyaml-cpp-dev libopenxr-dev \
    # Vulkan
    mesa-vulkan-drivers vulkan-validationlayers \
    && apt clean all
