
list(APPEND QML_DIRS "/usr/lib/x86_64-linux-gnu/qt5/qml")
list(APPEND QML_DIRS "/usr/lib/x86_64-linux-gnu/qt5/qml/org/kde")

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


)
find_package(KF5CoreAddons)
find_package(KF5 REQUIRED COMPONENTS
    Plasma # Required for cmake plasma_install_package()
    # I18n
    CoreAddons
    Config
)

plasma_install_package(package com.github.nofunever.pw_monitor_tool)

add_definitions(-DTRANSLATION_DOMAIN=\"plasma_applet_com.github.nofunever.pw_monitor_tool\")

set(qproc_plugin_SRCS
    qplugin/qproc.cpp
    qplugin/qproc.h
    qplugin/qproc_plugin.cpp
    qplugin/qproc_plugin.h
)

set(kproc_plugin_SRCS
    kplugin/kproc.cpp
    kplugin/kproc.h
    kplugin/kproc_plugin.cpp
    kplugin/kproc_plugin.h
)

add_library(qproc_plugin SHARED ${qproc_plugin_SRCS})

add_library(kproc_plugin SHARED ${kproc_plugin_SRCS})


target_link_libraries(qproc_plugin
    Qt::Core
    Qt::Qml
    KF5::CoreAddons
    KF5::ConfigCore
    # KF5::Plasma
    # KF5::I18n
)
target_link_libraries(kproc_plugin
    Qt::Core
    Qt::Qml
    KF5::CoreAddons
    KF5::ConfigCore
    # KF5::Plasma
    # KF5::I18n
)
install(TARGETS qproc_plugin DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/nofunever/pw_monitor_tool/qpp)
install(FILES qplugin/qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/nofunever/pw_monitor_tool/qpp)

install(TARGETS kproc_plugin DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/nofunever/pw_monitor_tool/kpp)
install(FILES kplugin/qmldir DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/nofunever/pw_monitor_tool/kpp)
