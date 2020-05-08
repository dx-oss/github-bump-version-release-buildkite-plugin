# Bump version and push the release to github

Buildkite plugin that bump version and release it to GitHub (github-bump-version-release-buildkite-plugin).

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      dx-oss/github-bump-version-release#v0.0.1:
        name: '*.md'
```

## Configuration

### `name` (Required, string)

The file name pattern, for example `*.ts`. Supports any pattern supported by [find -name](http://man7.org/linux/man-pages/man1/find.1.html).

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request