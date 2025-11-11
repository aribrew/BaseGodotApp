#!/bin/bash

usage()
{
    echo -e "Usage: debug.sh <Godot script path: Debug the given script.\n"
}


if [[ "$1" == "" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]];
then
    usage
    exit 1
fi


SCRIPT_HOME=$(realpath $(dirname $0))


GODOT_PATH_FILE="$SCRIPT_HOME/.godot_"
GODOT_PATH_FILE+=$(uname -n)
GODOT_PATH_FILE+="_path"


if ! [[ -f "$GODOT_PATH_FILE" ]];
then
    echo -e "Execute test.sh once before attempting to debug scripts.\n"
    exit 1
fi


TO_DEBUG="$1"

if ! [[ -f "$TO_DEBUG" ]] || ! [[ "$TO_DEBUG" == "*.gd" ]];
then
    echo -e "You must provide a valid Godot script to debug.\n"
    exit 1
fi


GODOT_PATH=$(cat "$GODOT_PATH_FILE")


"$GODOT_PATH" --check-only --script "$TO_DEBUG"
