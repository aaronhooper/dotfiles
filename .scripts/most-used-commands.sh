#!/bin/bash
# Sorts the command history by most used

history | awk '{ print $2 }' | sort | uniq -c | sort -n
