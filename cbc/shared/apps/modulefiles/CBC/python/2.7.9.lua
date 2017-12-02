help([[
Python - The Python Programming Language
]])

-- local name = myModuleName()
local name = "Python"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.python.org/")
whatis("Description: Python is a programming language that lets you work quickly and integrate systems more effectively.  Example: `python --version`.")

local path = "/home/shared/cbc/software"
local home = cbc_software .. "/" .. name .. "-" .. version

prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("PYTHONPATH", home .. "/lib/python2.7")
