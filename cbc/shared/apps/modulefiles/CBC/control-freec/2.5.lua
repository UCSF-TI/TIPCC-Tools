help([[
Control FREEC: Control-FREE Copy Number and Genotype Caller
]])

local name = "Control-FREEC"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://boevalab.com/FREEC/")
whatis("Description: Prediction of copy numbers and allelic content using deep-sequencing data.")

local path = "/home/shared/cbc/software_cbc"
prepend_path("PATH", path .. "/" .. name .. "-" .. version)
