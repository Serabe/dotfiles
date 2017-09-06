# Serabe's dotfiles

## Installation

1. Clone this repo.
2. Run `rake`

## Git custom config

The gitconfig includes a different file: `~/.git-custom-config`

In this file, the user can add custom configuration that won't be pushed to the
repo.

### Adding custom identities

Git since 2.13 has conditional includes. This way, in `~/.git-custom-config` we
can include the following configuration:

```toml
[includeIf "gitdir:~/some/dir/"]
    path = ~/some/other/.gitconfig
```
