# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jkl/monitor-tool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jkl/monitor-tool/build

# Include any dependencies generated for this target.
include CMakeFiles/pw_monitor_toolplugin.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/pw_monitor_toolplugin.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/pw_monitor_toolplugin.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pw_monitor_toolplugin.dir/flags.make

CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o: CMakeFiles/pw_monitor_toolplugin.dir/flags.make
CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o: pw_monitor_toolplugin_autogen/mocs_compilation.cpp
CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o: CMakeFiles/pw_monitor_toolplugin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jkl/monitor-tool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o -MF CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o.d -o CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o -c /home/jkl/monitor-tool/build/pw_monitor_toolplugin_autogen/mocs_compilation.cpp

CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jkl/monitor-tool/build/pw_monitor_toolplugin_autogen/mocs_compilation.cpp > CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.i

CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jkl/monitor-tool/build/pw_monitor_toolplugin_autogen/mocs_compilation.cpp -o CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.s

CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o: CMakeFiles/pw_monitor_toolplugin.dir/flags.make
CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o: /home/jkl/monitor-tool/plugin/monitor-tool.cpp
CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o: CMakeFiles/pw_monitor_toolplugin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jkl/monitor-tool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o -MF CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o.d -o CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o -c /home/jkl/monitor-tool/plugin/monitor-tool.cpp

CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jkl/monitor-tool/plugin/monitor-tool.cpp > CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.i

CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jkl/monitor-tool/plugin/monitor-tool.cpp -o CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.s

CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o: CMakeFiles/pw_monitor_toolplugin.dir/flags.make
CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o: /home/jkl/monitor-tool/plugin/pw_monitor_toolplugin.cpp
CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o: CMakeFiles/pw_monitor_toolplugin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jkl/monitor-tool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o -MF CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o.d -o CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o -c /home/jkl/monitor-tool/plugin/pw_monitor_toolplugin.cpp

CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jkl/monitor-tool/plugin/pw_monitor_toolplugin.cpp > CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.i

CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jkl/monitor-tool/plugin/pw_monitor_toolplugin.cpp -o CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.s

# Object files for target pw_monitor_toolplugin
pw_monitor_toolplugin_OBJECTS = \
"CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o" \
"CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o"

# External object files for target pw_monitor_toolplugin
pw_monitor_toolplugin_EXTERNAL_OBJECTS =

libpw_monitor_toolplugin.so: CMakeFiles/pw_monitor_toolplugin.dir/pw_monitor_toolplugin_autogen/mocs_compilation.cpp.o
libpw_monitor_toolplugin.so: CMakeFiles/pw_monitor_toolplugin.dir/plugin/monitor-tool.cpp.o
libpw_monitor_toolplugin.so: CMakeFiles/pw_monitor_toolplugin.dir/plugin/pw_monitor_toolplugin.cpp.o
libpw_monitor_toolplugin.so: CMakeFiles/pw_monitor_toolplugin.dir/build.make
libpw_monitor_toolplugin.so: CMakeFiles/pw_monitor_toolplugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jkl/monitor-tool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libpw_monitor_toolplugin.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pw_monitor_toolplugin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pw_monitor_toolplugin.dir/build: libpw_monitor_toolplugin.so
.PHONY : CMakeFiles/pw_monitor_toolplugin.dir/build

CMakeFiles/pw_monitor_toolplugin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pw_monitor_toolplugin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pw_monitor_toolplugin.dir/clean

CMakeFiles/pw_monitor_toolplugin.dir/depend:
	cd /home/jkl/monitor-tool/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jkl/monitor-tool /home/jkl/monitor-tool /home/jkl/monitor-tool/build /home/jkl/monitor-tool/build /home/jkl/monitor-tool/build/CMakeFiles/pw_monitor_toolplugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pw_monitor_toolplugin.dir/depend

