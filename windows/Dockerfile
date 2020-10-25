FROM stabletec/build-core:windows

COPY ps-scripts/powershell/windows-install/latest_versions.ps1 ps-scripts/

# VulkanSDK
COPY ps-scripts/powershell/windows-install/vulkan-sdk.ps1 ps-scripts/
RUN cd ps-scripts; .\latest_versions.ps1; .\vulkan-sdk.ps1

# Catch2
COPY ps-scripts/powershell/windows-install/catch.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1; .\latest_versions.ps1; .\catch.ps1

# GLFW
COPY ps-scripts/powershell/windows-install/glfw.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1; .\latest_versions.ps1; .\glfw.ps1

# fmt
COPY ps-scripts/powershell/windows-install/fmt.ps1 ps-scripts/
RUN cd ps-scripts; .\entrypoint.ps1; .\latest_versions.ps1; .\fmt.ps1
