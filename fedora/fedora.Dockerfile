FROM docker.io/stabletec/build-core:fedora

RUN dnf install -y \
    # Dependencies
    assimp-devel bullet-devel fmt-devel freeimage-devel \
    glfw-devel glm-devel glslang libevent-devel openxr openxr-devel \
    vulkan-devel yaml-cpp-devel libsodium-devel \
    # Vulkan
    mesa-vulkan-drivers vulkan-tools vulkan-validation-layers \
    # Other
    python3-pip python3-autopep8 shfmt \
    && dnf clean all

RUN pip3 install cmake-format[yaml]

# Catch 2 (v3)
ENV CATCH2_VER=v3.4.0
RUN curl -o catch2.tar.gz https://codeload.github.com/catchorg/Catch2/tar.gz/refs/tags/${CATCH2_VER} \
        && tar -xf catch2.tar.gz \
        && cd Catch2-* \
        && cmake -B build -G Ninja \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=lib \
                -DCATCH_BUILD_EXAMPLES=OFF \
                -DCATCH_ENABLE_COVERAGE=OFF \
                -DCATCH_ENABLE_WERROR=OFF \
                -DBUILD_TESTING=ON \
        && cmake --build build \
        && cmake --install build \
        && cd .. \
        && rm -rf Catch2-* catch2.tar.gz
