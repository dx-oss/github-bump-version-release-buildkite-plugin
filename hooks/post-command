#!/bin/bash
set -euo pipefail

buildkite_agent=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_AGENT:-buildkite-agent}

image="dxdx/docker-builder-dotnet:2.2"
image=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_IMAGE:-$image}

debug=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_DEBUG:-0}
if [ $debug -gt 0 ]; then
    env
    docker-compose version
    docker version
    docker ps
    whereis docker
    whoami
    pwd
fi

docker=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_DOCKER:-docker}
version=$($docker run -v $(pwd):/src -w /src --entrypoint dotnet --rm -it $image /gitversion/GitVersion.dll /output json /nofetch /showvariable semVer)

$buildkite_agent meta-data set version=$version
$buildkite_agent annotate --style "Using [$image] with GitVersion and SemVer"
$buildkite_agent annotate "Bump to version ${version}"

echo $version