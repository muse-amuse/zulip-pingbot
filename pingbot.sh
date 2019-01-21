#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

function zulip-notify {
    CONTENT="Site "${1}" seems to be down!"
    SUBJECT="Pingbot server problems"
    curl https://$ZULIP_REALM/api/v1/messages \
         -u $ZULIP_BOT_EMAIL:$ZULIP_BOT_KEY \
         -d "type=stream" \
         -d "to=$ZULIP_STREAM" \
         -d "subject=$SUBJECT" \
         -d "content=$CONTENT"
}

function verify {
    echo verifying $1
    set +e
    curl -sSfL $1 > /dev/null
    if [ ! $? -eq 0 ]; then
        set -e
        zulip-notify $1
    fi
}

pushd $(dirname $0)
for each in $(cat domains.txt); do
    verify $each
done
popd
