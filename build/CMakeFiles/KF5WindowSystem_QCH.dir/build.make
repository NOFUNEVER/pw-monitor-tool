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
CMAKE_SOURCE_DIR = /home/jkl/pw-monitor-tool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jkl/pw-monitor-tool/build

# Utility rule file for KF5WindowSystem_QCH.

# Include any custom commands dependencies for this target.
include CMakeFiles/KF5WindowSystem_QCH.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/KF5WindowSystem_QCH.dir/progress.make

KF5WindowSystem_QCH: CMakeFiles/KF5WindowSystem_QCH.dir/build.make
.PHONY : KF5WindowSystem_QCH

# Rule to build all files generated by this target.
CMakeFiles/KF5WindowSystem_QCH.dir/build: KF5WindowSystem_QCH
.PHONY : CMakeFiles/KF5WindowSystem_QCH.dir/build

CMakeFiles/KF5WindowSystem_QCH.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/KF5WindowSystem_QCH.dir/cmake_clean.cmake
.PHONY : CMakeFiles/KF5WindowSystem_QCH.dir/clean

CMakeFiles/KF5WindowSystem_QCH.dir/depend:
	cd /home/jkl/pw-monitor-tool/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jkl/pw-monitor-tool /home/jkl/pw-monitor-tool /home/jkl/pw-monitor-tool/build /home/jkl/pw-monitor-tool/build /home/jkl/pw-monitor-tool/build/CMakeFiles/KF5WindowSystem_QCH.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/KF5WindowSystem_QCH.dir/depend

