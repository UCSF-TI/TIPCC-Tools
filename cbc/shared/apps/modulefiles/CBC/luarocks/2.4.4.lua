help([[
LuaRocks: The Lua Package Manager
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Lua, programming, scripting")
whatis("URL: https://luarocks.org/")
whatis("Description: LuaRocks is the package manager for Lua modules. Example: `luarocks --help` and `luarocks install posix`.")

depends_on("lua")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
