help([[
CBC-shared Scripts and Binaries
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: http://cbi.ucsf.edu/")
whatis("Description: Utility scripts and binaries shared by UCSF CBI (formerly CBC).")

local cbc_shared = "/home/shared/cbc/shared"
prepend_path("PATH", cbc_shared .. "/bin")
prepend_path("PATH", cbc_shared .. "/local/bin")

