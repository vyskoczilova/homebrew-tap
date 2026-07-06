# homebrew-tap

Personal [Homebrew](https://brew.sh) tap for
[@vyskoczilova](https://github.com/vyskoczilova)'s tools.

## Tamp — keep your Mac awake

A small menu bar app plus a terminal CLI around macOS's built-in `caffeinate`.
Toggle keep-awake, run it for a duration (`tamp for 2h`) or until a time
(`tamp until 17:30`), choose which sleep to prevent (display / system / disk),
and see when *another* app is keeping the Mac awake.

### Install

```sh
brew install vyskoczilova/tap/tamp
```

Then put the menu bar app where launch-at-login can find it:

```sh
cp -R "$(brew --prefix tamp)/Tamp.app" /Applications/
open /Applications/Tamp.app
```

The release zips contain universal (Apple Silicon + Intel) binaries,
ad-hoc signed. Homebrew formula downloads don't get the Gatekeeper
quarantine attribute, so the app runs without any "damaged app" dialog.

### Uninstall

```sh
# 1. In the menu bar: Tamp → Settings… → untick "Launch at Login", then Quit Tamp.
# 2. Remove the app copy and the formula:
rm -rf /Applications/Tamp.app
brew uninstall tamp
# 3. Optional: remove state and preferences:
rm -rf "$HOME/Library/Application Support/Tamp"
defaults delete cz.kybernaut.tamp 2>/dev/null
```

### Upgrade

```sh
brew update && brew upgrade tamp
```
