#!/bin/sh
# Opens a random man page for reading

apropos -s 1 . | awk '{ print $1 }' | shuf | head -1 | xargs man
