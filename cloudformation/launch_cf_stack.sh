#!/usr/bin/env bash
set -e

if [ -z "$TEMPLATE_DIR" ]
then
    TEMPLATE_DIR="$(dirname $0)/templates"
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

aws cloudformation create-stack --stack-name myfirstteststack --region us-west-2 --template-body file:////$TEMPLATE_DIR//mytemplate.json
