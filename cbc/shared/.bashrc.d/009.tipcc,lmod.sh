## The default module framework is 'tcl', but will soon become 'lmod,quiet' /HB 2017-08-25
MODULE_FRAMEWORK=${MODULE_FRAMEWORK:-tcl}

if [[ $STARTUP_DONE != *"lmod"* ]]; then
    . $SHARED_ROOT/tipcc/.bashrc.d/009.lmod.sh
fi

