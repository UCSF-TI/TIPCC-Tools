help([[
Lua: The Lua Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://www.lua.org/")
whatis("Description: The Lua programming language. Example: `lua -v`.")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")
