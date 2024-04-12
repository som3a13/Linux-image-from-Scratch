cmake_minimum_required(VERSION 3.1...3.27)


set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Specify the cross compiler
set(TOOLCHAIN_PREFIX /home/som3a133/x-tools/arm-cortexa9_neon-linux-musleabihf/bin/arm-cortexa9_neon-linux-musleabihf)

# Set the path to the cross-compiler binaries
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)

# Set the path to the cross-compiler sysroot if necessary
# set(CMAKE_SYSROOT /home/som3a133/x-tools/arm-cortexa9_neon-linux-musleabihf/arm-cortexa9_neon-linux-musleabihf/sysroot)

# Adjust other settings as necessary, like include directories, libraries, etc.

#/home/som3a133/x-tools/arm-cortexa9_neon-linux-musleabihf/bin/arm-cortexa9_neon-linux-musleabihf-ldd --root /home/som3a133/x-tools/arm-cortexa9_neon-linux-musleabihf/arm-cortexa9_neon-linux-musleabihf/sysroot TestDeamon
project(
    CMAKEProject
    VERSION 1.0
)
set(CMAKE_EXE_LINKER_FLAGS "-static")
# change static to shared to make it dynamicly linked 

add_executable(TestDeamon)

target_sources(TestDeamon PRIVATE app.c)

