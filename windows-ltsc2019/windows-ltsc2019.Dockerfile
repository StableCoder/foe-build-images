FROM stabletec/build-core:windows-ltsc2019

# VulkanSDK
COPY install-scripts/vulkan-sdk.ps1 install-scripts/
RUN cd install-scripts; ./vulkan-sdk.ps1

# VulkanRuntime
COPY install-scripts/vulkan-runtime.ps1 install-scripts/
RUN cd install-scripts; ./vulkan-runtime.ps1

# OpenXR
COPY install-scripts/openxr.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./openxr.ps1

# Assimp
COPY install-scripts/assimp.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./assimp.ps1

# Bullet Physics
COPY install-scripts/bullet.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./bullet.ps1

# Catch2
COPY install-scripts/catch.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./catch.ps1

# GLFW
COPY install-scripts/glfw.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./glfw.ps1

# GLM
COPY install-scripts/glm.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./glm.ps1

# FreeImage
COPY install-scripts/freeimage.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./freeimage.ps1

# fmt
COPY install-scripts/fmt.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./fmt.ps1

# yaml-cpp
COPY install-scripts/yaml-cpp.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./yaml-cpp.ps1

# libsodium
COPY install-scripts/libsodium.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./libsodium.ps1

# libevent
COPY install-scripts/libevent.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./libevent.ps1