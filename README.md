# FoE Build Images

[![pipeline status](https://git.stabletec.com/foe/build-images/badges/main/pipeline.svg)](https://git.stabletec.com/foe/build-images/commits/main)
[![license](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://git.stabletec.com/foe/build-images/blob/main/LICENSE)
[![docker pulls](https://img.shields.io/docker/pulls/stabletec/build-foe.svg)](https://hub.docker.com/r/stabletec/build-foe/)
[![docker stars](https://img.shields.io/docker/stars/stabletec/build-foe.svg)](https://hub.docker.com/r/stabletec/build-foe/)

The Dockers images generated from this repository are used for building the FoE-Engine project.

## Supported tags and respective `Dockerfile` links

- [`fedora` (Dockerfile)](https://git.stabletec.com/foe/build-images/blob/main/fedora/Dockerfile)
- [`ubuntu` (Dockerfile)](https://git.stabletec.com/foe/build-images/blob/main/ubuntu/Dockerfile)
- [`windows` (Dockerfile)](https://git.stabletec.com/foe/build-images/blob/main/windows/Dockerfile)

## Architecture Support

| OS      | amd64 | arm64 | arm32v7 |
| ------- | ----- | ----- | ------- |
| Fedora  | X     | X     |         |
| Ubtuntu | X     | X     | X       |
| Windows | X     |       |         |

## Included Libraries

- [Assimp](https://github.com/assimp/assimp)
- [Catch](https://github.com/catchorg/Catch2)
- [fmt](https://github.com/fmtlib/fmt)
- [freeimage](https://freeimage.sourceforge.io/)
- [GLFW3](https://glfw.org)
- [glm](https://github.com/g-truc/glm)
- [OpenXR](https://www.khronos.org/OpenXR/)
- [Vulkan](https://www.khronos.org/vulkan/)
- [Yaml-cpp](https://github.com/jbeder/yaml-cpp)