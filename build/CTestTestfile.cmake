# CMake generated Testfile for 
# Source directory: /home/eos_jlamphere/pw-monitor-tool
# Build directory: /home/eos_jlamphere/pw-monitor-tool/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(appstreamtest "/usr/bin/cmake" "-DAPPSTREAMCLI=/usr/bin/appstreamcli" "-DINSTALL_FILES=/home/eos_jlamphere/pw-monitor-tool/build/install_manifest.txt" "-P" "/usr/share/ECM/kde-modules/appstreamtest.cmake")
set_tests_properties(appstreamtest PROPERTIES  _BACKTRACE_TRIPLES "/usr/share/ECM/kde-modules/KDECMakeSettings.cmake;162;add_test;/usr/share/ECM/kde-modules/KDECMakeSettings.cmake;180;appstreamtest;/usr/share/ECM/kde-modules/KDECMakeSettings.cmake;0;;/home/eos_jlamphere/pw-monitor-tool/CMakeLists.txt;13;include;/home/eos_jlamphere/pw-monitor-tool/CMakeLists.txt;0;")
