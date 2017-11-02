# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SECURITY: Assert file permissions
# - - - - - - -_- - - - - - - - - - - - - - - - - - - - - - - - - -
## TODO: For SSH login (to cluster and nodes), make sure the $HOME
##       folder don't share write permissions with group or others.
##       /HB & JJ /2017-10-27

## All users
#TODO# fix_permissions_to_user_only ${HOME}/.ssh
#TODO# fix_permissions_to_user_only ${HOME}/.ssh/authorized_keys

## 3 users
## fix_permissions_to_user_only ${HOME}/.netrc

## 0 users
fix_permissions_to_user_only ${HOME}/.pgpass
fix_permissions_to_user_only ${HOME}/.lftprc
fix_permissions_to_user_only ${HOME}/.lftp/rc
fix_permissions_to_user_only ${HOME}/.lftp/bookmarks
fix_permissions_to_user_only ${HOME}/.local/share/lftp/bookmarks
