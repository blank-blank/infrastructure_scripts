#!/usr/bin/env bash
set -e

if [ -z "$TEMPLATE_DIR" ]
then
    TEMPLATE_DIR="$(dirname $0)/cloudformation/templates"
fi
TEMPLATE_FILE="$1"
TEMPLATE_FILEPATH="${TEMPLATE_DIR}/${TEMPLATE_FILE}"

if [ -z $TEMPLATE_FILE ]
then
    echo "Usage: launch_cf_template template_file"
    exit 1
fi

if [ ! -f $TEMPLATE_FILEPATH ]
then
    echo $TEMPLATE_FILEPATH
    echo "TEMPLATE_FILEPATH does not exist" 
    exit 1
fi
exit
aws cloudformation create-stack --region us-west-2 --template-body file:////templates//mytemplate.json
