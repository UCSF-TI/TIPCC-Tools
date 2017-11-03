# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SECURITY: Assert file permissions
# - - - - - - -_- - - - - - - - - - - - - - - - - - - - - - - - - -
## TODO: For SSH login (to cluster and nodes), make sure the $HOME
##       folder don't share write permissions with group or others.
##       /HB & JJ /2017-10-27

## All users (5 affected)
## TEST: ls -la /home/*/.ssh | grep -E " [.]$" | grep -vE "[-][-][-][-]"
## DISCUSS: Is/should it be ok to share .ssh/ with group?
#TODO# fix_permissions_to_user_only ${HOME}/.ssh

## All users (5 affected)
## TEST: ls -la /home/*/.ssh/authorized_keys | grep -vE "[-][-][-]"
## DISCUSS: Is/should it be ok to share .ssh/authorized_keys with group?
#TODO# fix_permissions_to_user_only ${HOME}/.ssh/authorized_keys

#TODO# fix_permissions_to_user_only ${HOME}/.ssh/id_dsa
#TODO# fix_permissions_to_user_only ${HOME}/.ssh/id_rsa

## 3 users (1 affected)
## TEST: ls -la /home/*/.netrc | grep -vE "[-][-][-]"
#TODO# fix_permissions_to_user_only ${HOME}/.netrc

## 0 users
fix_permissions ${HOME}/.pgpass -...------ go-rwx
fix_permissions ${HOME}/.lftprc -...------ go-rwx
fix_permissions ${HOME}/.lftp/rc -...------ go-rwx
fix_permissions ${HOME}/.lftp/bookmarks -...------ go-rwx
fix_permissions ${HOME}/.local/share/lftp/bookmarks -...------ go-rwx
