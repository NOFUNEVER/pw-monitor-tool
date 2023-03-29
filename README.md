PW-Loopback-UI Plasmoid
This plasmoid offers a simple user interface for the pipewire-loopback module. Written in qml and C++, only compatible with pipewire.

Credit
 Jason Lamphere.

Features
PW-Loopback-UI has the following features:

Lists all available audio inputs and outputs.
Allows the user to create a loopback with system defaults or manually select an input and output to create a loopback.
TODO::Displays the current loopback status and allows the user to turn it on or off.

Installation
To test the PW-Loopback-UI plasmoid, follow these steps:

Install pipewire if it is not already installed. The plasmoid is only compatible with pipewire.
Download the source code from the GitHub repository.
Build the plasmoid using the following commands:


(cd ./build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr && make && sudo make install) && plasmoidviewer -a com.github.nofunever.pw_monitor_tool


Usage
To use the PW-Loopback-UI plasmoid, follow these steps:

Click on the plasmoid to open it.
The plasmoid will display a list of all available audio inputs and outputs.
Select the desired settings:
Default: Turns off the loopback.
Loopback Defaults: Creates a loopback using the default settings.
Loopback Selected: Creates a loopback using the selected input and output.
If you selected "Loopback Selected", select the desired input and output from the dropdown menus.
Click on the "Favorite" button to create loopback from the current settings and added it beneath the default options.
TODOThe plasmoid will display the current loopback status and allow you to turn it on or off.
