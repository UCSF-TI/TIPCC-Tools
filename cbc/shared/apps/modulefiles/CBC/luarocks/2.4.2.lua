help([[
LuaRocks - the Lua package manager
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://luarocks.org/")
whatis("Description: LuaRocks is the package manager for Lua modules.")

local path = "/home/shared/cbc/software_cbc"
prepend_path("PATH", path .. "/" .. name .. "-" .. version .. "/bin")
