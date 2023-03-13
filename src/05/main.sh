#!/bin/bash
chmod +x *.sh
dirName=$(dirname $0)
. ${dirName}/variableChecking.sh
. ${dirName}/action.sh