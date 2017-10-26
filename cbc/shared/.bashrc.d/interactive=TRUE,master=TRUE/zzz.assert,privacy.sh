# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SECURITY: Assert file permissions
# - - - - - - - to_- - - - - - - - - - - - - - - - - - - - - - - - - -
fix_permissions_to_user_only ${HOME}/.ssh
fix_permissions_to_user_only ${HOME}/.ssh/authorized_keys
fix_permissions_to_user_only ${HOME}/.pgpass
fix_permissions_to_user_only ${HOME}/.netrc
fix_permissions_to_user_only ${HOME}/.lftprc
fix_permissions_to_user_only ${HOME}/.lftp/rc
fix_permissions_to_user_only ${HOME}/.lftp/bookmarks
fix_permissions_to_user_only ${HOME}/.lftp/bookmarks
fix_permissions_to_user_only ${HOME}/.local/share/lftp/bookmarks

