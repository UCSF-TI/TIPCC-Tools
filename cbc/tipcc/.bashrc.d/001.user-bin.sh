# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# User installed software paths
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## 'pip install --user <foo>' installs into ~/.local/bin/
if [[ -d "${HOME}/.local/bin" ]]; then
  export PATH="${HOME}/.local/bin:${PATH}"
fi
