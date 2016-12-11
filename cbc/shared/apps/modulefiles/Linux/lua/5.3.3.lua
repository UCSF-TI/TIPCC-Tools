help([[
The Lua Programming Language
]])

local name = "lua"
local version = "5.3.3"
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://www.lua.org/")
whatis("Description: The Lua programming language")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")
