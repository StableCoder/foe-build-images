# PLATFORMS: linux/amd64
FROM docker.io/stabletec/build-core:arch

RUN pacman -Sy --noconfirm \
        # Dependencies 
        assimp bullet catch2 fmt glfw glm glslang imagemagick libevent libsodium openxr portaudio \
        sdl3 vulkan-headers yaml-cpp \
        # Vulkan
        vulkan-intel vulkan-radeon vulkan-swrast vulkan-tools vulkan-validation-layers \
        && pacman -Scc --noconfirm
