## Already done?
if [[ $STARTUP_DONE == *"warn-credentials"* ]]; then return; fi

## Running in interactive mode?
if [[ "$PS1" ]]; then
    if [[ -x /home/shared/cbc/tipcc/bin/tipcc ]]; then
        bfr=$(/home/shared/cbc/tipcc/bin/tipcc security --processes --mask --users $USER)
        if [[ -n "${bfr}" ]]; then
            tput setaf 1 2> /dev/null ## red
            >&2 echo
            >&2 echo "*************************************************************************"
            >&2 echo "** ALERT: You are exposing your credentials to all users on the cluster! "
            >&2 echo "**        See for instance 'ps aux | grep \$USER'                        "
            >&2 echo "*************************************************************************"
            >&2 printf '%s\n' "${bfr[@]}"
            >&2 echo
            tput sgr0 2> /dev/null    ## reset
        fi
    fi
    STARTUP_DONE="${STARTUP_DONE}:warn-credentials"
fi
