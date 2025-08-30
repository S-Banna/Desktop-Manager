#!/bin/bash
# standard run firefox and file explorer. rest will be handled in ahk

start firefox "$1" &

if [[ "$3" == "1" ]]; then
    explorer "C:\\Users\\flipflop\\Desktop\\temp\\$2"
fi

if [[ "$4" == "1" ]]; then
    code "C:/Users/flipflop/Desktop/temp/$2"
fi