# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SECURITY: Assert file permissions
# - - - - - - -_- - - - - - - - - - - - - - - - - - - - - - - - - -
## TODO: Move this to /home/shared/cbc/tipcc/.bashrc.d/ so it is
##       done for all users. /HB 2017-10-27
## TODO: For SSH login (to cluster and nodes), make sure the $HOME
## folder don't share write permissions with group or others.
## HB & JJ /2017-10-27
fix_permissions_to_user_only ${HOME}/.ssh
fix_permissions_to_user_only ${HOME}/.ssh/authorized_keys
#MOVED# fix_permissions_to_user_only ${HOME}/.pgpass
fix_permissions_to_user_only ${HOME}/.netrc
#MOVED# fix_permissions_to_user_only ${HOME}/.lftprc
#MOVED# fix_permissions_to_user_only ${HOME}/.lftp/rc
#MOVED# fix_permissions_to_user_only ${HOME}/.lftp/bookmarks
#MOVED# fix_permissions_to_user_only ${HOME}/.local/share/lftp/bookmarks
