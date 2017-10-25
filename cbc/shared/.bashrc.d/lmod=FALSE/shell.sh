if [[ $(using_lmod) -eq 0 ]]; then
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Default editor
  # Needed by for instance 'svn commit' etc
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if test "${EDITOR}" = ""; then
    export EDITOR="emacs -nw"
  fi
  
  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Misc
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Never use /usr/libexec/openssh/gnome-ssh-askpass
  unset SSH_ASKPASS
fi
