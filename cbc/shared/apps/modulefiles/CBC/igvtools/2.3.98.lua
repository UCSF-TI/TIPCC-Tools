help([[
IGVTools: Tools for Pre-processing HT-Seq Data Files
]])

-- local name = myModuleName()
local name = "IGVTools"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://software.broadinstitute.org/software/igv/igvtools")
whatis("Description: The igvtools utility provides a set of tools for pre-processing data files. Example: `igvtools help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
