# Settings for WSL

To create a symlink from WSL to Windows, run `mklink` from `cmd` as
admin:

```
mklink path\on\windows\settings.json \\wsl$\Ubuntu\...\.dotfiles\dev\wsl\settings.json
```


