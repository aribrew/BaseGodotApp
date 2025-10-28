#!/bin/bash

SCRIPT_HOME=$(realpath $(dirname $0))


GODOT_PATH_FILE="$SCRIPT_HOME/.godot_"
GODOT_PATH_FILE+=$(uname -n)
GODOT_PATH_FILE+="_path"


if ! [[ "$1" == "" ]]
then
    GODOT_PATH=$(realpath "$1")
fi


if ! [[ -f "$GODOT_PATH_FILE" ]];
then
    if [[ "$GODOT_PATH" == "" ]];
    then
        echo -e "Tell me which Godot executable to use for testing.\n"
        exit 1
    fi
fi


if ! [[ "$GODOT_PATH" == "" ]] && [[ -f "$GODOT_PATH" ]];
then
    echo "$GODOT_PATH" > "$GODOT_PATH_FILE"
    echo -e "Using '$GODOT_PATH' as the default Godot for this machine.\n"
fi


GODOT_PATH=$(cat "$GODOT_PATH_FILE")


if ! [[ -f "$GODOT_PATH" ]];
then
    echo -e "Cannot find '$GODOT_PATH'.\n"
    exit 1
fi


cd "$SCRIPT_HOME"
"$GODOT_PATH"
