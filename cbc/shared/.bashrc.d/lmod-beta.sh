# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Lua, LuaRocks and Lmod
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ -z "${MODULEPATH_LEGACY}" ]]; then
    export MODULEPATH_LEGACY="${MODULEPATH}"
fi

## Find also Lua modules installed via luarocks install --local
ver=$(luarocks config --lua-ver)
export LUA_PATH="${HOME}/.luarocks/share/lua/5.3/?.lua;${HOME}/.luarocks/share/lua/5.3/?/init.lua;/home/shared/cbc/software_cbc/luarocks-2.4.2/share/lua/5.3/?.lua;/home/shared/cbc/software_cbc/luarocks-2.4.2/share/lua/5.3/?/init.lua;/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua"
export LUA_CPATH="${HOME}/.luarocks/lib/lua/5.3/?.so;/home/shared/cbc/software_cbc/luarocks-2.4.2/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so"

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

use_lmod() {
    >&2 echo "[x] Using Lmod environment modules (BETA); see 'module avail'"
    >&2 echo "    https://github.com/UCSF-TI/TIPCC/wiki/Software-Environment-Modules-(BETA)"
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
        export __Init_Default_Modules=1;
        ## ability to predefine elsewhere the default list
        LMOD_SYSTEM_DEFAULT_MODULES=${LMOD_SYSTEM_DEFAULT_MODULES:-"StdEnv"}
        export LMOD_SYSTEM_DEFAULT_MODULES
        module --initial_load restore
    else
        module refresh
    fi
}


## For BETA users
## (http://lmod.readthedocs.io/en/latest/045_transition.html?highlight=no-lmod)
if [[ -f "${HOME}/.lmod" && ! -f "${HOME}/.no.lmod" ]]; then
    use_lmod
fi
