# My dotfiles
This is a collection of my configuration files.
I use it to have my personalised settings on any machine I work at.

## Installation

* vscode:
  - Create symbolic link of settings.json
  - Install_extensions.sh includes used extensions.
    *Haven't used vscode in a while. Check extensions before installing*

To create a symlink from WSL to Windows, run `mklink` from `cmd` as
admin:

```
mklink path\on\windows\settings.json \\wsl$\Ubuntu\...\.dotfiles\dev\wsl\settings.json
```
