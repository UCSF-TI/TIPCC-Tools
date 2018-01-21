help([[
LuaRocks: The Lua Package Manager
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://luarocks.org/")
whatis("Description: LuaRocks is the package manager for Lua modules. Example: `luarocks --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
