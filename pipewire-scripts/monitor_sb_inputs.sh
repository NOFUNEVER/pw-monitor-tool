#!/bin/bash

#!/bin/env bash
 var=$(pw-cli ls Node | grep -B 4 'node.description = "sb-line-in"' | sed '2,$d' | cut -f1 -d"," | cut -c 5- )
 var2=$(pw-cli ls Node | grep -B 4 'loopback' | sed '2,$d' | cut -f1 -d"," | cut -c 5- )
if [ -z "${var}" ] && [ -z "${var2}" ]

then
pw-loopback -l 1 -n 'sb-line-in' -m '[FL FR]' --capture-props='[media.class=Audio/Sink]' --capture='alsa_input.pci-0000_0a_00.0.pro-input-1' &
sleep 1
pw-loopback -l 1 -n 'sb-line-in' -m '[FL FR]' --capture-props='[media.class=Audio/Sink]' --capture='alsa_input.pci-0000_0a_00.0.pro-input-0' &

else
pw-cli destroy $var
pw-cli destroy $var2
fi





