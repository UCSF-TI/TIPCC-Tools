help([[
Lua: The Lua Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://www.lua.org/")
whatis("Description: The Lua programming language. Example: `lua -v`.")

prepend_path("PATH", "/usr/bin")
prepend_path("MANPATH", "/usr/share/man")
