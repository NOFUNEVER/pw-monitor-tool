#!/bin/bash
pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.name' | sed 's/^[^"]*"//' | rev | cut -c2- | rev


