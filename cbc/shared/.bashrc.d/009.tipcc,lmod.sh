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
            if [[ "$MODULE_FRAMEWORK" != *"quiet" ]]; then
                tput setaf 3 2> /dev/null ## yellow
                >&2 echo "WARNING: MODULE_FRAMEWORK='tcl' is deprecated in favor of 'lmod'"
                >&2 echo "         To silence this warning, use MODULE_FRAMEWORK='tcl,quiet'"
                tput sgr0 2> /dev/null    ## reset
            fi
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
