# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# User installed software paths
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## 'pip install --user <foo>' installs into ~/.local/bin/
if [[ -d "${HOME}/.local/bin" ]]; then
  prependPath ${HOME}/.local/bin
fi
