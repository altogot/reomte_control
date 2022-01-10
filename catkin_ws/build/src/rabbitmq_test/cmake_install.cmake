# Install script for directory: /home/xjh/remote_control/catkin_ws/src/rabbitmq_test

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/xjh/remote_control/catkin_ws/build/src/rabbitmq_test/catkin_generated/installspace/rabbitmq_test.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rabbitmq_test/cmake" TYPE FILE FILES
    "/home/xjh/remote_control/catkin_ws/build/src/rabbitmq_test/catkin_generated/installspace/rabbitmq_testConfig.cmake"
    "/home/xjh/remote_control/catkin_ws/build/src/rabbitmq_test/catkin_generated/installspace/rabbitmq_testConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rabbitmq_test" TYPE FILE FILES "/home/xjh/remote_control/catkin_ws/src/rabbitmq_test/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/xjh/remote_control/catkin_ws/bin/task")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/xjh/remote_control/catkin_ws/bin" TYPE EXECUTABLE FILES "/home/xjh/remote_control/catkin_ws/build/devel/lib/rabbitmq_test/task")
  if(EXISTS "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task"
         OLD_RPATH "/home/xjh/remote_control/catkin_ws/build/lib:/home/xjh/remote_control/catkin_ws/lib:/usr/local/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/task")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/xjh/remote_control/catkin_ws/bin/worker")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/xjh/remote_control/catkin_ws/bin" TYPE EXECUTABLE FILES "/home/xjh/remote_control/catkin_ws/build/devel/lib/rabbitmq_test/worker")
  if(EXISTS "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker"
         OLD_RPATH "/home/xjh/remote_control/catkin_ws/build/lib:/home/xjh/remote_control/catkin_ws/lib:/usr/local/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/worker")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/xjh/remote_control/catkin_ws/bin/test")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/xjh/remote_control/catkin_ws/bin" TYPE EXECUTABLE FILES "/home/xjh/remote_control/catkin_ws/build/devel/lib/rabbitmq_test/test")
  if(EXISTS "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test"
         OLD_RPATH "/home/xjh/remote_control/catkin_ws/build/lib:/home/xjh/remote_control/catkin_ws/lib:/usr/local/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/xjh/remote_control/catkin_ws/bin/test")
    endif()
  endif()
endif()

