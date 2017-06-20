help([[
CBC-shared Scripts and Binaries
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: https://cbc.ucsf.edu/")
whatis("Description: Utility scripts and binaries of the UCSF CBC group.")

local cbc_shared = "/home/shared/cbc"
prepend_path("PATH", cbc_shared .. "/bin")

