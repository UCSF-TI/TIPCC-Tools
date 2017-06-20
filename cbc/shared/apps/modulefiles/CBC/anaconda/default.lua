help([[
Anaconda Package Manager w/ CBC-shared installations
]])

local name = myModuleName()
--local version = myModuleVersion()
--whatis("Version: " .. version)
whatis("Keywords: package manager")
whatis("URL: https://www.continuum.io/anaconda-overview")
whatis("Description: Open Data Science Platform powered by Python")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"
local cbc_software_cbc = cbc_shared .. "/software_cbc"

local home = cbc_software_cbc .. "/" .. name
prepend_path("PATH", home .. "/bin")
