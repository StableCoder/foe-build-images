FROM stabletec/build-core:windows-2022

# VulkanSDK
COPY ps-scripts/powershell/windows-install/vulkan-sdk.ps1 ps-scripts/
RUN cd ps-scripts; .\vulkan-sdk.ps1

# VulkanRuntime
COPY ps-scripts/powershell/windows-install/vulkan-runtime.ps1 ps-scripts/
RUN cd ps-scripts; .\vulkan-runtime.ps1

# OpenXR
COPY ps-scripts/powershell/windows-install/openxr.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\openxr.ps1

# Assimp
COPY ps-scripts/powershell/windows-install/assimp.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\assimp.ps1

# Bullet Physics
COPY ps-scripts/powershell/windows-install/bullet.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\bullet.ps1

# Catch2
COPY ps-scripts/powershell/windows-install/catch.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\catch.ps1

# GLFW
COPY ps-scripts/powershell/windows-install/glfw.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\glfw.ps1

# GLM
COPY ps-scripts/powershell/windows-install/glm.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\glm.ps1

# FreeImage
COPY ps-scripts/powershell/windows-install/freeimage.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\freeimage.ps1

# fmt
COPY ps-scripts/powershell/windows-install/fmt.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\fmt.ps1

# yaml-cpp
COPY ps-scripts/powershell/windows-install/yaml-cpp.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\yaml-cpp.ps1

# libsodium
COPY ps-scripts/powershell/windows-install/libsodium.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\libsodium.ps1

# libevent
COPY ps-scripts/powershell/windows-install/libevent.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1 -Quiet; .\libevent.ps1