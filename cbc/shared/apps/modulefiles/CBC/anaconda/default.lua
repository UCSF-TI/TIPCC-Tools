help([[
[DEPRECATED] Anaconda Package Manager w/ CBC-shared installations
]])

local name = myModuleName()
--local version = myModuleVersion()
--whatis("Version: " .. version)
whatis("Keywords: package manager")
whatis("URL: https://www.continuum.io/anaconda-overview")
whatis("Description: Open Data Science Platform powered by Python")

local path = "/home/shared/cbc/software_deprecated"
local home = path .. "/" .. name
prepend_path("PATH", home .. "/bin")
