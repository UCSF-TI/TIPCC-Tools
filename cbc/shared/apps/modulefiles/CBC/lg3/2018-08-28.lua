help([[
LG3 Pipeline: The UCSF Costello Lab's LG3 Pipeline
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, mutations, tumor, normal")
whatis("URL: https://github.com/UCSF-Costello-Lab/LG3_Pipeline")
whatis("Description: This is the LG3 Pipeline developed by the UCSF Costello Lab.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. "LG3_Pipeline" .. "-" .. version

setenv("LG3_HOME", home)
setenv("LG3_OUTPUT_ROOT", "output")



