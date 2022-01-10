# Install script for directory: /home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so.7.0.1"
      "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so.7"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/libSimpleAmqpClient.so.7.0.1;/usr/lib/libSimpleAmqpClient.so.7")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/lib" TYPE SHARED_LIBRARY FILES
    "/home/xjh/remote_control/catkin_ws/build/lib/libSimpleAmqpClient.so.7.0.1"
    "/home/xjh/remote_control/catkin_ws/build/lib/libSimpleAmqpClient.so.7"
    )
  foreach(file
      "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so.7.0.1"
      "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so.7"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/usr/local/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/lib/libSimpleAmqpClient.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/lib" TYPE SHARED_LIBRARY FILES "/home/xjh/remote_control/catkin_ws/build/lib/libSimpleAmqpClient.so")
  if(EXISTS "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so"
         OLD_RPATH "/usr/local/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/usr/lib/libSimpleAmqpClient.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SimpleAmqpClient" TYPE FILE FILES
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/AmqpException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/AmqpLibraryException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/AmqpResponseLibraryException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/BadUriException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/BasicMessage.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/Channel.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/ConnectionClosedException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/ConsumerCancelledException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/ConsumerTagNotFoundException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/Envelope.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/MessageReturnedException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/MessageRejectedException.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/SimpleAmqpClient.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/Table.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/Util.h"
    "/home/xjh/remote_control/catkin_ws/utils/SimpleAmqpClient-master/src/SimpleAmqpClient/Version.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/xjh/remote_control/catkin_ws/lib/pkgconfig/libSimpleAmqpClient.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/xjh/remote_control/catkin_ws/lib/pkgconfig" TYPE FILE FILES "/home/xjh/remote_control/catkin_ws/build/utils/SimpleAmqpClient-master/libSimpleAmqpClient.pc")
endif()

