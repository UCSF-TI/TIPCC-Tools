help([[
The Python Programming Language
]])

local name = "Python"
local version = "2.7.9"
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.python.org/")
whatis("Description: The Python programming language")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("PYTHONPATH", home .. "/lib/python2.7")
