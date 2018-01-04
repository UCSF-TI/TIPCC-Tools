help([[
GDC Data Transfer Tool: NCI Genome Data Commons Data Transfer Tools
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: data, transfer")
whatis("URL: https://gdc.cancer.gov/access-data/gdc-data-transfer-tool")
whatis("Description: The GDC Data Transfer Tool Client provides a command-line interface supporting both GDC data downloads and submissions. Example: `gdc-client --version`.")

load("python/2.7.10")
unload("anaconda-python")

local path = "/opt/GDC"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH",  home .. "/bin")
