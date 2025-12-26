# ALTERNATE_TAGS: windows-ltsc2022
FROM stabletec/build-core:windows-ltsc2022-vs2026

# VulkanSDK
COPY windows-install-scripts/vulkan-sdk.ps1 install-scripts/
RUN cd install-scripts; ./vulkan-sdk.ps1 -Version 1.4.335.0 -EnvironmentVariableScope Machine

# VulkanRuntime
COPY windows-install-scripts/vulkan-runtime.ps1 install-scripts/
RUN cd install-scripts; ./vulkan-runtime.ps1 -Version 1.4.335.0

# OpenXR
COPY windows-install-scripts/openxr.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./openxr.ps1 -EnvironmentVariableScope Machine

# Assimp
COPY windows-install-scripts/assimp.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./assimp.ps1 -EnvironmentVariableScope Machine

# Bullet Physics
COPY windows-install-scripts/bullet.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./bullet.ps1 -EnvironmentVariableScope Machine

# Catch2
COPY windows-install-scripts/catch.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./catch.ps1 -EnvironmentVariableScope Machine

# GLFW
COPY windows-install-scripts/glfw.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./glfw.ps1 -EnvironmentVariableScope Machine

# SDL3
COPY windows-install-scripts/sdl3.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./sdl3.ps1 -EnvironmentVariableScope Machine

# GLM
COPY windows-install-scripts/glm.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./glm.ps1 -EnvironmentVariableScope Machine

# fmt
COPY windows-install-scripts/fmt.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./fmt.ps1 -EnvironmentVariableScope Machine

# yaml-cpp
COPY windows-install-scripts/yaml-cpp.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./yaml-cpp.ps1 -EnvironmentVariableScope Machine

# libsodium
COPY windows-install-scripts/libsodium.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./libsodium.ps1 -EnvironmentVariableScope Machine

# libevent
COPY windows-install-scripts/libevent.ps1 install-scripts/
RUN C:/ps-scripts/entrypoint.ps1 -Quiet; cd install-scripts; ./libevent.ps1 -EnvironmentVariableScope Machine

# imagemagick
RUN choco install -y imagemagick -PackageParameters InstallDevelopmentHeaders=true