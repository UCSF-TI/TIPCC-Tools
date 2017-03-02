## Already done?
if [[ $STARTUP_DONE == *"c4-head"* ]]; then return; fi

## Running in interactive mode and on the head node?
if [[ "$PS1" && "$HOSTNAME" == "cclc01.som.ucsf.edu" ]]; then
    if [[ -x /home/shared/cbc/bin/c4-head ]]; then
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
    STARTUP_DONE="${STARTUP_DONE}:c4-head"
fi
