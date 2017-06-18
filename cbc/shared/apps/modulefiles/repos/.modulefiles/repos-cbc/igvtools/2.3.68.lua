help([[
IGVTools
]])

local name = "IGVTools"
local version = "2.3.68"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://software.broadinstitute.org/software/igv/igvtools")
whatis("Description: The igvtools utility provides a set of tools for pre-processing data files.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
