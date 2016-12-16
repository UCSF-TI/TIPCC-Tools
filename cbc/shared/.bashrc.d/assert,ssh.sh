# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SECURITY: Assert file permissions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
assertUserOnlyPermissions ${HOME}/.ssh
assertUserOnlyPermissions ${HOME}/.ssh/authorized_keys
assertUserOnlyPermissions ${HOME}/.netrc
assertUserOnlyPermissions ${HOME}/.pine-passfile
assertUserOnlyPermissions ${HOME}/cron-bin/ucsf_mail_fetch_keep
