# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Git
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
  # Remove alias 'git', iff set
  alias git=foo
  unalias git
  # Add  git installation
  ## prependPath /opt/rh/devtoolset-2/root/usr/bin/
  
  prependPath /opt/Git/Git-latest/bin
  prependPath ${SHARED_SOFTWARE}/gitflow-0.4.2/bin
fi
