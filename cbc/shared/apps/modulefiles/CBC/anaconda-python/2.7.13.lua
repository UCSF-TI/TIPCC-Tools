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

local path = "/home/shared/cbc/software_deprecated"
local home = path .. "/anaconda"
prepend_path("PYTHONPATH", home .. "/lib/python2.7")
