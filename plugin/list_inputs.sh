#!/bin/bash
pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.description' | sed 's/^[^"]*"//'
