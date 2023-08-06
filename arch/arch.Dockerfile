FROM docker.io/stabletec/build-core:arch

RUN pacman -Sy --noconfirm \
        # Dependencies 
        assimp bullet fmt freeimage glfw glm glslang libevent libsodium openxr portaudio vulkan-headers yaml-cpp \
        # Vulkan
        vulkan-intel vulkan-radeon vulkan-swrast vulkan-tools vulkan-validation-layers \
        && pacman -Scc --noconfirm

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