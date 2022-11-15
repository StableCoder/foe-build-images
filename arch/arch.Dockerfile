FROM docker.io/stabletec/build-core:arch

RUN pacman -Sy --noconfirm \
        # Additional Formatters
        shfmt autopep8 \
        # Dependencies 
        assimp portaudio bullet vulkan-headers fmt glm glfw freeimage catch2 yaml-cpp openxr glslang \
        # Vulkan
        vulkan-intel vulkan-radeon vulkan-swrast vulkan-tools vulkan-validation-layers \
        && pacman -Scc
