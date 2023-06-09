#!/bin/bash -l

set -eo pipefail

# Check Configuration

if [ -z "$CONVERT_TO" ]; then
    echo "error: CONVERT_TO is not set to either prod or dev"
    exit 1
fi

if [ -z "$IDENTIFIER" ]; then
    echo "warning: IDENTIFIER is not set.  Using dev."
    export IDENTIFIER="dev"
fi

if [ -z "$INSTRUQT_API_KEY" ]; then
    echo "error: INSTRUQT_API_KEY is not set."
    exit 1
fi

if [ -z "$INSTRUQT_ORG_SLUG" ]; then
    echo "error: INSTRUQT_ORG_SLUG is not set."
    exit 1
fi

if [ -z "$INSTRUQT_API_URL" ]; then
    echo "warning: INSTRUQT_API_URL is not set.  Using https://play.instruqt.com/graphql"
    export INSTRUQT_API_URL="https://play.instruqt.com/graphql"
fi

# Convert the track
convert --track ${GITHUB_WORKSPACE} --to ${CONVERT_TO} --identifier ${IDENTIFIER}