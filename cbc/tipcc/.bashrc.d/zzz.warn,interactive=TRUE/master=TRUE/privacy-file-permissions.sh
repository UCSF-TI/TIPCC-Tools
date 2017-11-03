# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SSH
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## All users (6 affected)
## RULE: Home directory must not be writable by anyone but the user in
##       order for SSH to work.
## TEST: ls -la /home/ | grep -E "^d....w....$"
## fix_permissions ${HOME} d....-..-. go-w

## All users (5 affected)
## RULE: ~/.ssh/ must not be accessible by any others user.
## DISCUSS: Is/should it be ok to share .ssh/ with group?
## TEST: ls -la /home/*/.ssh | grep -E " [.]$" | grep -vE "[-][-][-][-]"
#TODO# fix_permissions ${HOME}/.ssh d...------ go-rwx

## All users (5 affected)
## RULE: ~/.ssh/authorized_keys must not be accessible by any others user.
## DISCUSS: Is/should it be ok to share .ssh/authorized_keys with group?
## TEST: ls -la /home/*/.ssh/authorized_keys | grep -vE "[-][-][-]"
#TODO# fix_permissions ${HOME}/.ssh/authorized_keys -...------ go-rwx

#TODO# fix_permissions ${HOME}/.ssh/id_dsa -...------ go-rwx
#TODO# fix_permissions ${HOME}/.ssh/id_rsa -...------ go-rwx


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## Files that may contain user's authentication credentials
## and should therefore not be accessible by any other user
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## 3 users (1 affected)
## TEST: ls -la /home/*/.netrc | grep -vE "[-][-][-]"
#TODO# fix_permissions ${HOME}/.netrc -...------ go-rwx

## 0 users
fix_permissions ${HOME}/.pgpass -...------ go-rwx
fix_permissions ${HOME}/.lftprc -...------ go-rwx
fix_permissions ${HOME}/.lftp/rc -...------ go-rwx
fix_permissions ${HOME}/.lftp/bookmarks -...------ go-rwx
fix_permissions ${HOME}/.local/share/lftp/bookmarks -...------ go-rwx
