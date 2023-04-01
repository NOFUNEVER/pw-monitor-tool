# Install script for directory: /home/jkl/pw-monitor-tool

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
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

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plasmoid-pw_monitor_tool" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/plasma/plasmoids/com.github.nofunever.pw_monitor_tool" TYPE DIRECTORY FILES "/home/jkl/pw-monitor-tool/package/" REGEX "/\\.svn$" EXCLUDE REGEX "/[^/]*\\.qmlc$" EXCLUDE REGEX "/CMakeLists\\.txt$" EXCLUDE REGEX "/Messages\\.sh$" EXCLUDE REGEX "/dummydata$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plasmoid-pw_monitor_tool" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/plasma/plasmoids/com.github.nofunever.pw_monitor_tool" TYPE FILE FILES "/home/jkl/pw-monitor-tool/package/metadata.json")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plasmoid-pw_monitor_tool" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo" TYPE FILE OPTIONAL FILES "/home/jkl/pw-monitor-tool/build/com.github.nofunever.pw_monitor_tool.appdata.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plasmoid-pw_monitor_tool" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool/libqproc_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool/libqproc_plugin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool/libqproc_plugin.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool" TYPE SHARED_LIBRARY FILES "/home/jkl/pw-monitor-tool/build/libqproc_plugin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool/libqproc_plugin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool/libqproc_plugin.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool/libqproc_plugin.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plasmoid-pw_monitor_tool" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "plasmoid-pw_monitor_tool" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/x86_64-linux-gnu/qt5/qml/com/github/nofunever/pw_monitor_tool" TYPE FILE FILES "/home/jkl/pw-monitor-tool/qplugin/qmldir")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jkl/pw-monitor-tool/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
