#!/bin/sh

set -x
set -e

if [ -z "$PLUGIN_REPO" ]; then
    echo "No repo name!"
    exit 1
fi

if [ -z "$PLUGIN_EVENT" ]; then
    echo "No specific event!"
    exit 1
fi

region="us-east-1"
if [ -n "$PLUGIN_REGION" ]; then
    region="$PLUGIN_REGION"
fi

aws ecr get-login --no-include-email --region $region | sh
if [[ "$PLUGIN_EVENT" == "pull" ]]; then
    docker pull "$PLUGIN_REPO"
fi

exit 0
