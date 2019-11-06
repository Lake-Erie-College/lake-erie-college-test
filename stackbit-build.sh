#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc33f438619fa001b8d9084/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc33f438619fa001b8d9084
curl -s -X POST https://api.stackbit.com/project/5dc33f438619fa001b8d9084/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dc33f438619fa001b8d9084/webhook/build/publish > /dev/null
