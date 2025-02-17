#!/bin/bash
set -eu

JSON_PAYLOAD=$(
    jq -n \
        --arg type "note" \
        --arg title "$PB_TITLE" \
        --arg body "$PB_TEXT" \
        '{type: $type, title: $title, body: $body}'
)

curl \
    --silent --show-error \
    -X POST \
    --header "Content-Type: application/json" \
    --header "Authorization: Bearer ${PB_TOKEN}" \
    --data "$JSON_PAYLOAD" \
    "https://api.pushbullet.com/v2/pushes"
