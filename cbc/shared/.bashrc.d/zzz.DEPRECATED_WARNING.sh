if [[ $USER == "cbctest" ]]; then
    tput setaf 3 2> /dev/null ## yellow
    >&2 echo "******************************************************************************"
    >&2 echo "* DEPRECATION WARNING (since 2017-10-28)"
    >&2 echo "*"
    >&2 echo "* You are using:"
    >&2 echo "*"
    >&2 echo "*   source /home/shared/cbc/bashrc"
    >&2 echo "*"
    >&2 echo "* in your startup (e.g. in ~/.bashrc). This will become defunct on 2017-11-11"
    >&2 echo "* and then result in an error message. Instead, replace the above with:"
    >&2 echo "*"
    >&2 echo "*   module load CBC cbc-shared"
    >&2 echo "*"
    >&2 echo "* and you are good to go. Everything should work the same as before."
    >&2 echo "******************************************************************************"
    tput sgr0 2> /dev/null    ## reset
fi
