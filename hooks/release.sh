#!/bin/bash

pwd=$(pwd)

source $pwd/hooks/common.sh

version=$(buildkite-agent meta-data get version)

echo $version
echo $VERSION
