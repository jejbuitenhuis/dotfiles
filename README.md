# Flower with leaves (dotfiles)

# Color pallet

| Name | Color |
|------|-------|
| Foreground | ![#ffe3ff](https://via.placeholder.com/300x100/ffe3ff/?text=+) |
| Background | ![#0d0d0d](https://via.placeholder.com/300x100/0d0d0d/?text=+) |
| Gray | ![#333333](https://via.placeholder.com/300x100/333333/?text=+) |
| Red | ![#f99f9b](https://via.placeholder.com/300x100/f99f9b/?text=+) |
| Green | ![#a2f28a](https://via.placeholder.com/300x100/a2f28a/?text=+) |
| Yellow | ![#eef2bb](https://via.placeholder.com/300x100/eef2bb/?text=+) |
| Blue | ![#96c7f2](https://via.placeholder.com/300x100/96c7f2/?text=+) |
| Pink | ![#f2a2e5](https://via.placeholder.com/300x100/f2a2e5/?text=+) |
| Cyan | ![#8af2ec](https://via.placeholder.com/300x100/8af2ec/?text=+) |
| "White" | ![#ffe3ff](https://via.placeholder.com/300x100/ffe3ff/?text=+) |

# VSCode extensions

## Install all

Run this in a terminal to install all VSCode extensions:

```bash
cat vscode/extensions.txt | xargs -L 1 code --install-extension
```

## Update extensions list

Run this in a terminal to update the extensions list:

```bash
code --list-extensions | grep -Ev "$(find ./vscode/extensions/ -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | tr "\n" "|" | sed "s/|$//")" > vscode/extensions.txt
```
