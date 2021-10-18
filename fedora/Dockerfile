FROM docker.io/stabletec/build-core:fedora

RUN dnf install -y \
    assimp-devel \
    bullet-devel \
    catch-devel \
    fmt-devel \
    freeimage-devel \
    glfw-devel \
    glm-devel \
    glslang \
    openxr-devel \
    vulkan-devel \
    yaml-cpp-devel \
    && dnf clean all

RUN pip install cmake-format[yaml]
