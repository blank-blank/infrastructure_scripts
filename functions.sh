#!/usr/bin/env bash

function require(){
	cmd_name=$1
	command -v $cmd_name >/dev/null 2>&1 || { echo >&2 "I require $cmd_name but it's not installed.  Aborting."; exit 1; }
}

export -f require
