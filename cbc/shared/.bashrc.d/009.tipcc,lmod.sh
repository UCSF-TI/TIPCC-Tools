## The default module framework for CBC-shared is now 'lmod' (was 'tcl') /HB 2017-09-01
MODULE_FRAMEWORK=${MODULE_FRAMEWORK:-lmod}

if [[ $STARTUP_DONE == *"lmod"* ]]; then
    ## If already called, then make sure above default CBC-shared settings
    ## are in place, otherwise fix.
    if [[ $(using_lmod) -eq 0 ]]; then
        if [[ $MODULE_FRAMEWORK == *"lmod"* ]]; then
            ## Inconsistent => redo
            STARTUP_DONE=${STARTUP_DONE/:lmod/}
        else
            tput setaf 3 2> /dev/null ## yellow
            >&2 echo "******************************************************************************"
            >&2 echo "* DEPRECATION WARNING (for 2017-10-31)"
            >&2 echo "*"
            >&2 echo "* You are using:"
            >&2 echo "*"
            >&2 echo "*   MODULE_FRAMEWORK=tcl"
            >&2 echo "*   source /home/shared/cbc/bashrc"
            >&2 echo "*"
            >&2 echo "* in your startup (e.g. in ~/.bashrc). This will become defunct on 2017-10-31"
            >&2 echo "* and then result in an error message. Instead, replace the above with:"
            >&2 echo "*"
            >&2 echo "*   module load CBC cbc-shared"
            >&2 echo "*"
            >&2 echo "******************************************************************************"
            tput sgr0 2> /dev/null    ## reset
        fi
    else
        if [[ $MODULE_FRAMEWORK != *"lmod"* ]]; then
            ## Inconsistent => redo
            STARTUP_DONE=${STARTUP_DONE/:lmod/}
        fi
    fi
fi

if [[ $STARTUP_DONE != *"lmod"* ]]; then
    ## Just in case not already called by the global TIPCC startup scripts
    . $SHARED_ROOT/tipcc/.bashrc.d/009.lmod.sh
fi
