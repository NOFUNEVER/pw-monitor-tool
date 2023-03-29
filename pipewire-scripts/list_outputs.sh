#!/bin/bash
pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.description' | sed 's/^[^"]*"//' | rev | cut -c2- | rev

