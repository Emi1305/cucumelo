# Introduction

Cucumelo is a minimal linux distro for raspberry pi based on LFS

## Steps

./run.sh

### Real steps

1. Create the disk image for building:
    src/builder.sh
1. Get the dependencies for building the target system:
    src/dependencies.sh
1. Verify the signatures of the downloaded dependencies:
    src/verify_dependencies.sh
1. Create the initial file system:
    src/generate_fs.sh
1. Create the toolchain for cross-compiling the target system:
    src/toolchain.sh
1. Build the target system's directory structure
    src/target_fs.sh
1. Create initial files for the target system and basic packages (i.e. libc and busybox)
    src/initial_files.sh
1. Make the image bootable



## Toolchain building

In order to create a toolchain for cross-compiling we need:

1. Install linux headers
1. Create our initial compiler for our host machine that is gonna build the C library for out target machine (GCC)
1. Compile a libc implementation for the target machine (musl)
1. Create the final compiler (GCC)
