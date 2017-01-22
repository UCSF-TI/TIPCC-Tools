help([[
Control FREEC: Control-FREE Copy Number and Genotype Caller
]])

local name = "Control-FREEC"
local version = "7.2-3"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://boevalab.com/FREEC/")
whatis("Description: Prediction of copy numbers and allelic content using deep-sequencing data.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")
