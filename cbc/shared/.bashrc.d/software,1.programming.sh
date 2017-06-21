# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Programming languages
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Lua, LuaRocks and Lmod
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
prependPath ${SHARED_SOFTWARE}/lua-latest/bin
prependPath ${SHARED_SOFTWARE}/luarocks-latest/bin

## Find also Lua modules installed via luarocks install --local
ver=$(luarocks config --lua-ver)
export LUA_PATH="${HOME}/.luarocks/share/lua/5.3/?.lua;${HOME}/.luarocks/share/lua/5.3/?/init.lua;/home/shared/cbc/software_cbc/luarocks-2.4.2/share/lua/5.3/?.lua;/home/shared/cbc/software_cbc/luarocks-2.4.2/share/lua/5.3/?/init.lua;/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua"
export LUA_CPATH="${HOME}/.luarocks/lib/lua/5.3/?.so;/home/shared/cbc/software_cbc/luarocks-2.4.2/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Ruby
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
prependPath ${SHARED_SOFTWARE}_cbc/bin

if [[ $(using_lmod) -eq 0 ]]; then
module_load valgrind "/coregrind"
##prependPath ${SHARED_SOFTWARE}/valgrind-latest/coregrind

module_load jdk
## prependPath ${SHARED_SOFTWARE}/jdk-latest/bin

module_load matlab
## prependPath ${SHARED_SOFTWARE}/matlab-latest/bin

module_load R
##prependPath ${SHARED_SOFTWARE}/R-latest/bin
## WORKAROUND: Some packages are hard/fail to install in R 3.2.0, e.g. 'png'.
## These are shared by CBC.
export R_LIBS_SITE=/home/shared/cbc/R/site-library/%p-library/%v

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Containers
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
module_load udocker ""
## prependPath ${SHARED_SOFTWARE}/udocker-latest
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# CBC Developement Settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $CBC_DEVEL != "true" ]]; then
    #prependPath /opt/llvm/llvm-3.5.0/bin
    export GCC_HOME=/opt/gcc/gcc-4.9.2
    if test -d "${GCC_HOME}"; then
        prependPath ${GCC_HOME}/bin
        export LD_LIBRARY_PATH="${GCC_HOME}/lib64:${LD_LIBRARY_PATH}"
    fi
    
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # BUILDS
    #
    # ./configure --prefix=${SHARED_ROOT}/local/
    # make
    # make install
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    export CPPFLAGS="-I${SHARED_ROOT}/local/include $CPPFLAGS"
    export LDFLAGS="-L${SHARED_ROOT}/local/lib $LDFLAGS"
    export LD_LIBRARY_PATH="${SHARED_ROOT}/local/lib:${LD_LIBRARY_PATH}"
fi
