# Use the latest Windows Server Core image.
FROM stabletec/build-core:msys-ltsc2025-mingw64

RUN function msys() { C:\msys64\usr\bin\bash.exe @('-lc') + @Args; } \
    msys ' '; \
    msys 'pacman --noconfirm -Sy'; \
    msys 'pacman --noconfirm -S ${MINGW_PACKAGE_PREFIX}-assimp ${MINGW_PACKAGE_PREFIX}-bullet ${MINGW_PACKAGE_PREFIX}-catch ${MINGW_PACKAGE_PREFIX}-fmt ${MINGW_PACKAGE_PREFIX}-freeimage ${MINGW_PACKAGE_PREFIX}-glfw ${MINGW_PACKAGE_PREFIX}-glm ${MINGW_PACKAGE_PREFIX}-glslang ${MINGW_PACKAGE_PREFIX}-libevent ${MINGW_PACKAGE_PREFIX}-libsodium ${MINGW_PACKAGE_PREFIX}-openxr-sdk ${MINGW_PACKAGE_PREFIX}-portaudio ${MINGW_PACKAGE_PREFIX}-vulkan-headers ${MINGW_PACKAGE_PREFIX}-yaml-cpp'; \
    msys 'pacman --noconfirm -Scc'
