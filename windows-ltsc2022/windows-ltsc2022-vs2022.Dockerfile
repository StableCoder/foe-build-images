# ALTERNATE_TAGS: windows-ltsc2022
FROM stabletec/build-core:windows-ltsc2022-vs2022

# VulkanSDK
COPY windows-install-scripts/vulkan-sdk.ps1 install-scripts/
RUN cd install-scripts; ./vulkan-sdk.ps1

# VulkanRuntime
COPY windows-install-scripts/vulkan-runtime.ps1 install-scripts/
RUN cd install-scripts; ./vulkan-runtime.ps1 -Version 1.4.304.0

# OpenXR
COPY windows-install-scripts/openxr.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./openxr.ps1

# Assimp
COPY windows-install-scripts/assimp.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./assimp.ps1

# Bullet Physics
COPY windows-install-scripts/bullet.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./bullet.ps1

# Catch2
COPY windows-install-scripts/catch.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./catch.ps1

# GLFW
COPY windows-install-scripts/glfw.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./glfw.ps1

# GLM
COPY windows-install-scripts/glm.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./glm.ps1

# FreeImage
COPY windows-install-scripts/freeimage.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./freeimage.ps1

# fmt
COPY windows-install-scripts/fmt.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./fmt.ps1

# yaml-cpp
COPY windows-install-scripts/yaml-cpp.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./yaml-cpp.ps1

# libsodium
COPY windows-install-scripts/libsodium.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./libsodium.ps1

# libevent
COPY windows-install-scripts/libevent.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./libevent.ps1