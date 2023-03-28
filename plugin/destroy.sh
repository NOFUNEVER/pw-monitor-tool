#!/bin/bash

 var2=$(pw-cli ls Node | grep -B 4 'loopback' | sed '2,$d' | cut -f1 -d"," | cut -c 5- )


pw-cli destroy $var2

var=$(pw-cli ls Node | grep -B 4 'loopback' | sed '2,$d' | cut -f1 -d"," | cut -c 5- )

pw-cli destroy $var

