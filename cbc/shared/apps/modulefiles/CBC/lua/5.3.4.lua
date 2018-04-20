help([[
Lua: The Lua Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://www.lua.org/")
whatis("Description: The Lua programming language. Example: `lua -v`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version

prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")

-- used by GCC compiler/static linker
prepend_path("CPATH", home .. "/include")
prepend_path("LIBRARY_PATH", home .. "/lib")
