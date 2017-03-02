help([[
Valgrind
]])

local name = "valgrind"
local version = "3.8.1"
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: http://www.valgrind.org/")
whatis("Description: Valgrind")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path( "PATH", "/usr/bin")
