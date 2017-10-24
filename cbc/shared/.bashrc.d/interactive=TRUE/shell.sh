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
