help([[
"This is an example of a basic Lua Module files"
]])

local name = "example"
local version = "0.1"
whatis("Version: " .. version)
whatis("Keywords: Example")
whatis("URL: http://content.allinea.com/downloads/userguide.pdf")
whatis("Description: Example of Lua Module files")

-- Print a message
-- (must *not* be sent to stdout because that is parsed the shell)
-- io.stderr:write("Module " .. name .. "/" .. version .. "\n")

-- Local variables
-- local cbc_shared = "/home/shared/cbc"
-- local cbc_software = cbc_shared .. "/software"

-- Setting an command-line alias
set_alias("foo", "echo 'Foo!'")

-- setenv(       "DDTPATH",        "/opt/apps/ddt/5.0.1/bin")
-- prepend_path( "PATH",           "/opt/apps/ddt/5.0.1/bin")
-- prepend_path( "LD_LIBRARY_PATH","/opt/apps/ddt/5.0.1/lib")
