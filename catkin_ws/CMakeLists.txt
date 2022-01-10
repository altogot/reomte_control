cmake_minimum_required(VERSION 3.0.2)
project(remote_control)


set(UTILS_INCLUDE_DIRS
    ${CMAKE_SOURCE_DIR}/utils/
    ${CMAKE_SOURCE_DIR}/utils/jsoncpp/include/
    # ${CMAKE_SOURCE_DIR}/utils/qcloud-iot-sdk-embedded-c-3.2.1/include/
    # ${CMAKE_SOURCE_DIR}/utils/qcloud-iot-sdk-embedded-c-3.2.1/sdk_src/

    ${CMAKE_SOURCE_DIR}/utils/qcloud-iot-sdk-embedded-c-3.2.3/include/
    ${CMAKE_SOURCE_DIR}/utils/qcloud-iot-sdk-embedded-c-3.2.3/sdk_src/
    ${CMAKE_SOURCE_DIR}/utils/qcloud-iot-sdk-embedded-c-3.2.3/external_libs/mbedtls

)

# 设置二进制文件安装目录
set(CMAKE_INSTALL_BINDIR ${CMAKE_SOURCE_DIR}/bin)
# 设置库文件安装目录
set(CMAKE_INSTALL_LIBDIR ${CMAKE_SOURCE_DIR}/lib)
# 设置头文件的安装目录
set(CMAKE_INSTALL_INCLUDEDIR ${CMAKE_SOURCE_DIR}/include)


set(LIB_LINK_PATH /usr/lib/x86_64-linux-gnu/)

add_subdirectory(utils)
add_subdirectory(src)
