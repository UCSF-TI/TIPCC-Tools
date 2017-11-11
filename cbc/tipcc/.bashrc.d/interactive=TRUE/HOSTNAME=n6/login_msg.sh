if [[ "$PS1" && $HOSTNAME == n6 && ! -d /scratch ]]; then
    tput setaf 3 2> /dev/null ## yellow
    >&2 echo
    >&2 echo "*************************************************************************"
    >&2 echo "* NOTE: /scratch is currently unavailable on node n6. We are working on     "
    >&2 echo "*       fixing it. When done, we might have to reboot again. /2017-11-07 "
    >&2 echo "*************************************************************************"
    true
    >&2 echo
    tput sgr0 2> /dev/null    ## reset
fi
