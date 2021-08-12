FROM stabletec/build-core:arch

RUN pacman -Sy && \
    pacman -S --noconfirm \
    assimp portaudio bullet vulkan-headers fmt glm glfw freeimage catch2 yaml-cpp openxr glslang && \
    pacman -Scc