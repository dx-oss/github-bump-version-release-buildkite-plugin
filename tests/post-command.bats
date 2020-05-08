#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Creates an annotation with the file count" {
  run "$PWD/hooks/post-command"

  assert_success
}