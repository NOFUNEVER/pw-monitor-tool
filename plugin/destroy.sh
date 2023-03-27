#!/bin/bash
 var=$(pw-cli ls Node | grep -B 4 'sb-line-in' | sed '2,$d' | cut -f1 -d"," | cut -c 5- )
 var2=$(pw-cli ls Node | grep -B 4 'loopback' | sed '2,$d' | cut -f1 -d"," | cut -c 5- )

pw-cli destroy $var
pw-cli destroy $var2


