
list(APPEND QML_DIRS "/usr/lib/x86_64-linux-gnu/qt5/qml")


cmake_minimum_required(VERSION 3.16)

project(plasmoid-pw_monitor_tool)

find_package(ECM 1.4.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)

find_package(Qt5 REQUIRED COMPONENTS
    Core
    Qml
    Multimedia
)

find_package(KF5 REQUIRED COMPONENTS
    Plasma # Required for cmake plasma_install_package()
    # I18n
)

plasma_install_package(package com.github.nofunever.pw_monitor_tool)

add_definitions(-DTRANSLATION_DOMAIN=\"plasma_applet_com.github.nofunever.pw_monitor_tool\")

set(pw_monitor_toolplugin_SRCS
    plugin/monitor-tool.cpp
    plugin/monitor-tool.h
    plugin/pw_monitor_toolplugin.cpp
    plugin/pw_monitor_toolplugin.h
)

add_library(pw_monitor_toolplugin SHARED ${pw_monitor_toolplugin_SRCS})

target_link_libraries(pw_monitor_toolplugin
    Qt::Core
    Qt::Qml
    # KF5::Plasma
    # KF5::I18n
)

install(TARGETS pw_monitor_toolplugin DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/nofunever/pw_monitor_tool)
install(FILES plugin/qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/nofunever/pw_monitor_tool)
