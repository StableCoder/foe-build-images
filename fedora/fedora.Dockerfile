FROM docker.io/stabletec/build-core:fedora

RUN dnf install -y \
    # Dependencies
    assimp-devel bullet-devel catch-devel fmt-devel freeimage-devel \
    glfw-devel glm-devel glslang openxr openxr-devel vulkan-devel yaml-cpp-devel \
    # Vulkan
    mesa-vulkan-drivers vulkan-tools vulkan-validation-layers \
    && dnf clean all

RUN pip install cmake-format[yaml]
