help([[
Control FREEC: Control-FREE Copy Number and Genotype Caller
]])

local name = "Control-FREEC"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://boevalab.com/FREEC/")
whatis("Description: Prediction of copy numbers and allelic content using deep-sequencing data. Example: `freec`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
