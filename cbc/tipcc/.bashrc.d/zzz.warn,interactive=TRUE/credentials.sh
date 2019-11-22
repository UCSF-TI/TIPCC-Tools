## Already done?
if [[ $STARTUP_DONE == *"warn-credentials"* ]]; then return; fi

## AD HOC WORKAROUND: Don't run the below on non-Scyld nodes /HB+JJ 2017-11-13
if [[ $HOSTNAME =~ ^(n29|n30|n31|n32|n33|n34|n35|n36|n37)$ ]]; then return; fi

## Running in interactive mode?
if [[ "$PS1" ]]; then
    if [[ -x /home/shared/cbc/tipcc/bin/tipcc ]]; then
	## This check can be rather time-consuming, especially on clogged-up nodes.
	## We'll allow it to timeout if taking too long.
        bfr=$(timeout 5s /home/shared/cbc/tipcc/bin/tipcc security --processes --mask --users $USER)
	## Timeout?
	if [[ $? -eq 124 ]]; then return; fi
	
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
