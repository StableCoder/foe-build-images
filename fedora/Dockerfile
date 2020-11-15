FROM stabletec/build-core:fedora

RUN dnf install -y \
    catch-devel \
    fmt-devel \
    glfw-devel \
    glm-devel \
    glslang \
    vulkan-devel \
    yaml-cpp-devel \
    && dnf clean all

RUN pip install cmake-format[yaml]