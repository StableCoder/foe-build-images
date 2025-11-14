# FoE Build Images

[![pipeline status](https://git.stabletec.com/foe/build-images/badges/main/pipeline.svg)](https://git.stabletec.com/foe/build-images/commits/main)
[![license](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/StableCoder/foe-build-images/tree/main/LICENSE)
[![docker pulls](https://img.shields.io/docker/pulls/stabletec/build-foe.svg)](https://hub.docker.com/r/stabletec/build-foe/)
[![docker stars](https://img.shields.io/docker/stars/stabletec/build-foe.svg)](https://hub.docker.com/r/stabletec/build-foe/)

The Dockers images generated from this repository are used for building the FoE-Engine project.

## Current tags and respective `Dockerfile` links

- [`arch` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/arch/arch.Dockerfile)
- [`debian` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/debian/debian.Dockerfile)
- [`fedora` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/fedora/fedora.Dockerfile)
- [`msys-ltsc2022-clang64` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/msys-ltsc2022/msys-ltsc2022-clang64.Dockerfile)
- [`msys-ltsc2022-mingw64` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/msys-ltsc2022/msys-ltsc2022-mingw64.Dockerfile)
- [`msys-ltsc2022-ucrt64` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/msys-ltsc2022/msys-ltsc2022-ucrt64.Dockerfile)
- [`msys-ltsc2025-clang64` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/msys-ltsc2025/msys-ltsc2025-clang64.Dockerfile)
- [`msys-ltsc2025-mingw64` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/msys-ltsc2025/msys-ltsc2025-mingw64.Dockerfile)
- [`msys-ltsc2025-ucrt64` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/msys-ltsc2025/msys-ltsc2025-ucrt64.Dockerfile)
- [`opensuse` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/opensuse/opensuse.Dockerfile)
- [`ubuntu` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/ubuntu/ubuntu.Dockerfile)
- [`windows-ltsc2022-vs2019` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/windows-ltsc2022/windows-ltsc2022-vs2019.Dockerfile)
- [`windows-ltsc2022-vs2022` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/windows-ltsc2022/windows-ltsc2022-vs2022.Dockerfile)
- [`windows-ltsc2022-vs2026`, `windows-ltsc2022` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/windows-ltsc2022/windows-ltsc2022-vs2026.Dockerfile)
- [`windows-ltsc2025-vs2019` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/windows-ltsc2025/windows-ltsc2025-vs2019.Dockerfile)
- [`windows-ltsc2025-vs2022` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/windows-ltsc2025/windows-ltsc2025-vs2022.Dockerfile)
- [`windows-ltsc2025-vs2026`, `windows-ltsc2025`, `windows` (Dockerfile)](https://github.com/StableCoder/foe-build-images/tree/main/windows-ltsc2025/windows-ltsc2025-vs2026.Dockerfile)

## Architecture Support

| OS             | amd64 | arm64 | ppc64le | s390x | riscv64 |
| -------------- | ----- | ----- | ------- | ----- | ------- |
| Arch (SteamOS) | X     |       |         |       |         |
| Debian         | X     | X     | X       | X     | X       |
| Fedora         | X     | X     | X       | X     |         |
| MSYS/MinGW     | X     |       |         |       |         |
| openSUSE       | X     | X     | X       |       |         |
| Ubtuntu        | X     | X     | X       | X     | X       |
| Windows        | X     |       |         |       |         |

## Included Libraries

- [Assimp](https://github.com/assimp/assimp)
- [Bullet Physics](https://github.com/bulletphysics/bullet3)
- [Catch](https://github.com/catchorg/Catch2)
- [fmt](https://github.com/fmtlib/fmt)
- [freeimage](https://freeimage.sourceforge.io/)
- [GLFW3](https://glfw.org)
- [glm](https://github.com/g-truc/glm)
- [libevent](https://libevent.org/)
- [libsodium](https://doc.libsodium.org/)
- [OpenXR](https://www.khronos.org/OpenXR/)
- [Vulkan](https://www.khronos.org/vulkan/)
- [Yaml-cpp](https://github.com/jbeder/yaml-cpp)