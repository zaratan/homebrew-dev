# homebrew-dev

A [Homebrew](https://brew.sh) tap for my developer tooling.

## Installation

```sh
brew tap zaratan/dev
brew install wt
```

## Available formulae

| Formula | Description                                 | Upstream                                             |
| ------- | ------------------------------------------- | ---------------------------------------------------- |
| `wt`    | Git worktree manager integrated with herdr  | [zaratan/wt](https://github.com/zaratan/wt)          |

## How updates land

`bump-formulae.yml` runs daily: `brew livecheck` compares each formula's
version against the upstream GitHub release, and opens a pull request with the
new version and sha256. Nothing is pushed from the upstream repositories, so
they need no token for this tap.

## Platform support

The formulae here are **macOS arm64 only**, because the bump workflow rewrites
a single `sha256` per formula. Other platforms are served by each project's own
install script, for example:

```sh
curl -fL https://raw.githubusercontent.com/zaratan/wt/main/scripts/install.sh | bash
```
