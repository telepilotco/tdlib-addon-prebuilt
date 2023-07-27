[![Build TDLib binaries](https://github.com/telepilotco/tdlib-addon-prebuilt/actions/workflows/build-binaries.yml/badge.svg)](https://github.com/telepilotco/tdlib-addon-prebuilt/actions/workflows/build-binaries.yml)

# tdlib-addon-prebuilt


 + linux-x64-glibc
 + linux-x64-musl (x86-64/x86_64 -> x64)
 + linux-arm64-glibc (aarch64 -> arm64)
 + linux-arm64-musl (aarch64 -> arm64)
 - macos-arm64
 - macos-x64

## Github Action Builds

Build process is automated with Github Actions for following environments:

- linux-x64-glibc
- linux-x64-musl
- linux-arm64-glibc
- linux-arm64-musl

MacOs / Windows builds are currently not configured, but adding them would be also possible so please submit 
Issue request if you are willing to have those added, or send a PR.

## Building o local machine

If you would like to perform fully local build, few targets are defined  in `Makefile` that enable Dockerized 
as well as native `tdlib` builds.

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
