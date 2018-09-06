help([[
CBC-shared Scripts and Binaries
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: http://cbi.ucsf.edu/")
whatis("Description: Utility scripts and binaries shared by UCSF CBI (formerly CBC).")

prepend_path("PATH", "/home/shared/cbc/shared/bin")

prepend_path("PATH", "/home/shared/cbc/local/bin")
load("bzip2")
load("curl")
load("libpng")
load("xz")
load("emacs")
load("zlib")
