if [[ "$PS1" && $HOSTNAME == n6 && ! -d /scratch ]]; then
    tput setaf 3 2> /dev/null ## yellow
    >&2 echo
    >&2 echo "*************************************************************************"
    >&2 echo "* NOTE: /scratch is currently unavailable on node n6."
    >&2 echo "*       We are working on replacing it. /2017-11-07"
    >&2 echo "*************************************************************************"
    true
    >&2 echo
    tput sgr0 2> /dev/null    ## reset
fi
