## Running in interactive mode?
if [[ "$PS1" && -n "${BASHRC_CHECK}" ]]; then
    ## ... on the head node? (c4 head only works there)
    if test "$HOSTNAME" == "cclc01.som.ucsf.edu"; then
        bfr=$(/home/shared/cbc/bin/c4 head --user ${USER})
        if [[ -n "${bfr}" ]]; then
            >&2 echo "******************************************************************"
            >&2 echo "** WARNING: You are running the below processes on the head node"
            >&2 echo "**          (please use node n6 instead)"
            >&2 echo "******************************************************************"
            >&2 /home/shared/cbc/bin/c4 head --user ${USER}
        fi
    fi
fi
