## Already done?
if [[ $STARTUP_DONE == *"lmod"* ]]; then return; fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Lua, LuaRocks and Lmod
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ -z "${MODULEPATH_LEGACY}" ]]; then
    export MODULEPATH_LEGACY="${MODULEPATH}"
fi


## WORKAROUND: When using Lmod, then `module avail` command will
## run in an end-less loop and consume huge amount of memory (leak?)
## iff we would keep /usr/share/Modules/modulefiles in MODULEPATH.
## TROUBLESHOOTING: File /usr/share/Modules/modulefiles/modules
## contains `module use /usr/share/Modules`, which seems to cause
## an infinite loop.  If commented out, the problem goes away.
## /HB 2016-12-11
if [[ -z "${MODULEPATH_DEFAULT}" ]]; then
    export MODULEPATH_DEFAULT="/etc/modulefiles:/opt/scyld/modulefiles"
fi
if [[ -z "${MODULEPATH_USER}" ]]; then
    if [[ -d "${HOME}/modulefiles" ]]; then
        export MODULEPATH_USER="${HOME}/modulefiles"
    fi
fi


function clean_lmod() {
    ## FIXME: Something is adding /cbc/GitHub/ duplicated paths
    export MODULEPATH=$(echo $MODULEPATH | sed 's|/cbc/GitHub/[^:]*:||g')
    export MODULEPATH=$(echo ${MODULEPATH} | sed -E 's/::/:/g')
    
    ## WORKAROUND:
    ## 'module load StdEnv' may introduce :: in LD_LIBRARY_PATH
    ## (which e.g. Linux brew will complain about)
    export LD_LIBRARY_PATH=$(echo ${LD_LIBRARY_PATH} | sed -E 's/:$//')
}

function use_lmod() {
    if [[ "${PS1}" ]]; then
      >&2 echo "# Lmod environment modules (BETA)"
      >&2 echo
      >&2 echo "Usage:"
      >&2 echo " module avail         - list available modules"
      >&2 echo " module load <module> - load a module"
      >&2 echo " module list          - your loaded modules"
      >&2 echo
      >&2 echo "Documentation:"
      >&2 echo " https://github.com/UCSF-TI/TIPCC/wiki/Software-Environment-Modules"
      >&2 echo
    fi
    export MODULEPATH_ROOT=
    export MODULEPATH=
    source /home/shared/cbc/apps/lmod/lmod/init/profile
    export MODULEPATH="${MODULEPATH}:${MODULEPATH_DEFAULT}"

    if [[ -n "${MODULEPATH_USER}" ]]; then
        export MODULEPATH="${MODULEPATH_USER}:${MODULEPATH}"
    fi

    ## Default modules for all users, cf. ${MODULEPATH_ROOT}/Core/StdEnv.lua
    ## http://lmod.readthedocs.io/en/latest/070_standard_modules.html?highlight=MODULE%20DEFAULT
    if [ -z "$__Init_Default_Modules" ]; then
        if [[ "${PS1}" ]]; then
            >&2 printf "Refreshing modules ."
	fi
        ## ability to predefine elsewhere the default list
        export LMOD_SYSTEM_DEFAULT_MODULES=${LMOD_SYSTEM_DEFAULT_MODULES:-"StdEnv"}
        module --initial_load restore 2> /dev/null
        if [[ "${PS1}" ]]; then
            >&2 printf "."
	fi
#        module restore 2> /dev/null
        export __Init_Default_Modules=1
        if [[ "${PS1}" ]]; then
            >&2 printf ". done\n"
	fi
        >&2 echo ""
    else
        module refresh
    fi

    function module_load() {
        local name=$1
        name=${name,,} ## To lower case
        local modulepath=$MODULEPATH
        ## Don't load from the Spack software stack
        MODULEPATH=$(echo $MODULEPATH | tr : '\n' | grep -vF "spack/lmod" | tr '\n' :)
##        mecho "module_load ${name}"
#        module load ${name}
        MODULEPATH=$modulepath
    }
    
    clean_lmod

    function using_lmod() {
	type module | grep -q LMOD
	if [[ $? -eq 0 ]]; then echo 1; else echo 0; fi
    }

    module load StdEnv
}

function using_lmod() {
    echo 0
}


## For BETA users
## https://github.com/UCSF-TI/TIPCC/wiki/Software-Environment-Modules
## (http://lmod.readthedocs.io/en/latest/045_transition.html?highlight=no-lmod)
if [[ "$MODULE_FRAMEWORK" = "lmod" ]]; then
    use_lmod
fi

## mecho "MODULEPATH=$(echo $MODULEPATH | tr : '\n')"

STARTUP_DONE="${STARTUP_DONE}:lmod"
