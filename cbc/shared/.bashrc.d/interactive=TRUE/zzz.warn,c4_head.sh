## Nothing to do?
if [[ $CBC_STARTUP_COMPLETED == *"c4_head"* ]]; then
    return;
fi

## Running in interactive mode?
if [[ "$PS1" ]]; then
    ## ... on the head node? (c4 head only works there)
    if test "$HOSTNAME" == "cclc01.som.ucsf.edu"; then
        bfr=$(/home/shared/cbc/bin/c4-head --user ${USER})
        if [[ -n "${bfr}" ]]; then
            tput setaf 3 2> /dev/null ## yellow
            >&2 echo
            >&2 echo "******************************************************************"
            >&2 echo "** WARNING: You are running the below processes on the head node"
            >&2 echo "**          (please use n6 for prototyping / interactive use)"
            >&2 echo "******************************************************************"
            >&2 printf '%s\n' "${bfr[@]}"
            >&2 echo
            tput sgr0 2> /dev/null    ## reset
        fi
    fi
    
    ## Flag as done
    export CBC_STARTUP_COMPLETED="${CBC_STARTUP_COMPLETED} c4_head"
fi
