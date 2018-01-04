help([[
IGVTools
]])

-- local name = myModuleName()
local name = "IGVTools"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://software.broadinstitute.org/software/igv/igvtools")
whatis("Description: The igvtools utility provides a set of tools for pre-processing data files.")

local path = "/home/shared/cbc/software_cbc"
prepend_path("PATH", path .. "/" .. name .. "-" .. version)
