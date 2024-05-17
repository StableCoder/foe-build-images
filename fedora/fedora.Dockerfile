# PLATFORMS: linux/amd64 linux/arm64 linux/ppc64le linux/s390x
FROM docker.io/stabletec/build-core:fedora AS BUILDER

RUN echo "%_topdir /root/rpmbuild" > ~/.rpmmacros
RUN dnf install -y rpm-build

RUN curl -o vulkan-headers-1.3.280.0-1.fc40.src.rpm https://archives.fedoraproject.org/pub/fedora/linux/updates/40/Everything/source/tree/Packages/v/vulkan-headers-1.3.280.0-1.fc40.src.rpm
RUN curl -o vulkan-loader-1.3.280.0-1.fc40.src.rpm https://archives.fedoraproject.org/pub/fedora/linux/updates/40/Everything/source/tree/Packages/v/vulkan-loader-1.3.280.0-1.fc40.src.rpm

RUN rpm -ivh vulkan-headers-1.3.280.0-1.fc40.src.rpm
RUN rpm -ivh vulkan-loader-1.3.280.0-1.fc40.src.rpm
RUN sed -i 's/1.3.280/1.3.283/g' ~/rpmbuild/SPECS/vulkan-headers.spec ~/rpmbuild/SPECS/vulkan-loader.spec

RUN curl -o ~/rpmbuild/SOURCES/Vulkan-Headers-sdk-1.3.283.0.tar.gz -L https://github.com/KhronosGroup/Vulkan-Headers/archive/vulkan-sdk-1.3.283.0.tar.gz
RUN curl -o ~/rpmbuild/SOURCES/Vulkan-Loader-sdk-1.3.283.0.tar.gz -L https://github.com/KhronosGroup/Vulkan-Loader/archive/vulkan-sdk-1.3.283.0.tar.gz

RUN rpmbuild -ba ~/rpmbuild/SPECS/vulkan-headers.spec
RUN find ~/rpmbuild/RPMS/

RUN dnf install -y wayland-devel libX11-devel libXrandr-devel python3-devel
RUN dnf install -y /root/rpmbuild/RPMS/noarch/vulkan-headers-1.3.283.0-1.fc40.noarch.rpm
RUN rpmbuild -ba ~/rpmbuild/SPECS/vulkan-loader.spec

RUN find ~/rpmbuild/RPMS/ -name '*.rpm' -exec cp '{}' /tmp \;

FROM docker.io/stabletec/build-core:fedora

COPY --from=BUILDER /tmp/*.rpm /tmp/

RUN dnf install -y \
    # Special Vulkan RPMS
    /tmp/vulkan-headers-*.rpm /tmp/vulkan-loader-devel-1*.rpm /tmp/vulkan-loader-1*.rpm \
    # Dependencies
    assimp-devel bullet-devel catch-devel fmt-devel freeimage-devel \
    glfw-devel glm-devel glslang libevent-devel openxr openxr-devel \
    vulkan-devel yaml-cpp-devel libsodium-devel \
    # Vulkan
    mesa-vulkan-drivers vulkan-tools vulkan-validation-layers \
    # Other
    python3-pip python3-autopep8 shfmt \
    && dnf clean all

RUN pip3 install cmake-format[yaml]
