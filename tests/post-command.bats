#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# https://github.com/sstephenson/bats

@test "Fetch version from current git repo with gitversion" {
  #export BUILDKITE_PLUGIN_GITHUB_BUMP_VERSION_RELEASE_DEBUG="1"
  
  ver=v1.0.0
  
  stub buildkite-agent "annotate : echo $ver"
  stub docker "run : echo $ver"

  run "$PWD/hooks/post-command"
  
  assert_output --partial "$ver"
  assert_success

  unstub docker
  #unstub buildkite-agent
}