#!/bin/bash

source $BUILDKITE_BUILD_PATH/hooks/common.sh

version=$(buildkite-agent meta-data get version)

echo $version
echo $VERSION
