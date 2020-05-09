#!/bin/bash

pwd=$(pwd)

ls -la

source $pwd/hooks/common.sh

version="v0.0.0"

dotnet_args="--rm -it $image /gitversion/GitVersion.dll /output json /nofetch /showvariable semVer"

# check if dotnet is installed
# $dotnet --list-runtimes | true
# dotnet_check=$(${PIPESTATUS[@]})
# if [ $dotnet_check -eq 0 ]; then
#     version=$($dotnet $dotnet_args)
# else
#     version=$($docker run -v $(pwd):/src -w /src --entrypoint dotnet $dotnet_args)
# fi

version=$($docker run -v $(pwd):/src -w /src --entrypoint dotnet $dotnet_args)

$buildkite_agent meta-data set version $version
$buildkite_agent annotate --style "Using [$image] with GitVersion and SemVer"
$buildkite_agent annotate "Bump to version ${version}"

export VERSION=$version

echo $version
