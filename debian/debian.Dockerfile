FROM docker.io/stabletec/build-core:debian

RUN apt update \
    && apt install -y \
    # Dependencies
    glslang-tools libassimp-dev libbullet-dev libevent-dev libfmt-dev  \
    libfreeimage-dev libglfw3-dev libglm-dev libopenxr-dev libsodium-dev \
    libvulkan-dev libyaml-cpp-dev \
    # Vulkan
    mesa-vulkan-drivers vulkan-tools vulkan-validationlayers \
    # Other
    curl \
    && apt clean all

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