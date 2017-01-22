help([[
CBC Tools binaries and scripts
]])

local name = "cbc-bin"
local version = "0.1.0"
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: https://cbc.ucsf.edu/")
whatis("Description: Utilites of the UCSF CBC group.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_shared .. "/bin")

