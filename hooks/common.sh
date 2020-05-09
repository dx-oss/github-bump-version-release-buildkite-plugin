#!/bin/bash
set -euo pipefail

dotnet=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_DOTNET:-dotnet}
github_release=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_RELEASE:-github-release}
buildkite_agent=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_AGENT:-buildkite-agent}

image="dxdx/docker-builder-dotnet:2.2"
image=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_IMAGE:-$image}

debug=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_DEBUG:-0}
if [ $debug -gt 0 ]; then
    #whereis docker
    env
    #docker-compose version
    docker version
    docker ps    
    whoami
    pwd
fi

docker=${BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_DOCKER:-docker}
