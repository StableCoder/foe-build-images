FROM docker.io/stabletec/build-core:arch

RUN pacman -Sy
RUN pacman -S --noconfirm \
        # Additional Formatters
        shfmt autopep8 \
        # Library Dependencies 
        assimp portaudio bullet vulkan-headers fmt glm glfw freeimage catch2 yaml-cpp openxr glslang \
        # SW Vulkan Renderer
        vulkan-swrast
RUN pacman -Scc