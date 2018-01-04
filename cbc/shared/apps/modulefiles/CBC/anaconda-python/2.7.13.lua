help([[
[DEPRECATED] Anaconda: The Python Programming Language
]])

local name = "Python"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.python.org/")
whatis("Description: The Python programming language (by Anaconda)")

load("anaconda")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software_cbc = cbc_shared .. "/software_cbc"

local home = cbc_software_cbc .. "/anaconda"
prepend_path("PYTHONPATH", home .. "/lib/python2.7")
