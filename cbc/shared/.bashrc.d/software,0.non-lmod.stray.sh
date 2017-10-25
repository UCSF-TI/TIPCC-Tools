# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Lua, LuaRocks and Lmod
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
    ## module load lua
    prependPath ${SHARED_SOFTWARE}/lua-latest/bin
    
    ## module load luarocks
    prependPath ${SHARED_SOFTWARE}/luarocks-latest/bin
fi

## TODO: Add this to the 'luarocks' module
## Find also Lua modules installed via luarocks install --local
ver=$(luarocks config --lua-ver)
export LUA_PATH="${HOME}/.luarocks/share/lua/5.3/?.lua;${HOME}/.luarocks/share/lua/5.3/?/init.lua;/home/shared/cbc/software_cbc/luarocks-2.4.2/share/lua/5.3/?.lua;/home/shared/cbc/software_cbc/luarocks-2.4.2/share/lua/5.3/?/init.lua;/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua"
export LUA_CPATH="${HOME}/.luarocks/lib/lua/5.3/?.so;/home/shared/cbc/software_cbc/luarocks-2.4.2/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Ruby (and other tools)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
    prependPath ${SHARED_SOFTWARE}_cbc/bin
fi
x
