[![Build TDLib binaries](https://github.com/telepilotco/tdlib-addon-prebuilt/actions/workflows/build-binaries.yml/badge.svg)](https://github.com/telepilotco/tdlib-addon-prebuilt/actions/workflows/build-binaries.yml)

# tdlib-addon-prebuilt

This module allows using [tdlib/td](https://github.com/tdlib/td) library from nodejs application via Node Native Api.

It includes some TS/JS code and C++ application that can be compiled from source using **node-gyp**.

Alternatively, we have perbuilt binaries that can be fetched by **node-pre-gyp** from our website.

Prebuilt binaries are available for following architectures:
 - [x] linux-x64-glibc
 - [x] linux-x64-musl (x86-64/x86_64 -> x64)
 - [x] linux-arm64-glibc (aarch64 -> arm64)
 - [x] linux-arm64-musl (aarch64 -> arm64)
 - [x] macos-arm64 - local build
 - [x] macos-x64 - local build (x86_64 -> x64)

## Github Action Builds

Build process is automated with Github Actions for following environments:

- linux-x64-glibc
- linux-x64-musl
- linux-arm64-glibc (cross-build)
- linux-arm64-musl (cross-build)

MacOs / Windows builds are currently not configured, but adding them would be also possible so please submit 
Issue request if you are willing to have those added, or send a PR.

MacOs binary can be built locally using `build-lib-native` Makefile task.

## Building o local machine

If you would like to perform fully local build, few targets are defined  in `Makefile` that enable both dockerized 
and native builds of loader addon.

To start dockerized build, use one of the following `make` targets:
```
build-lib-docker-linux-arm64-glibc
build-lib-docker-linux-arm64-musl
build-lib-docker-linux-x64-glibc
build-lib-docker-linux-x64-musl
```

If you want to perform native build, use `make build-lib-native`. In this case you need to make sure you have required 
tooling installed on your system. `make init` should be able to help you with that.

If something still does not work, please refer to `prebuilt-tdlib-docker.sh` script which is used in dockerized build.
