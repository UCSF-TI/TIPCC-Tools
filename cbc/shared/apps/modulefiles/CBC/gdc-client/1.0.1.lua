help([[
GDC Data Transfer Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: data, transfer")
whatis("URL: https://gdc.cancer.gov/access-data/gdc-data-transfer-tool")
whatis("Description: The GDC provides a standard client-based mechanism in support of high performance data downloads and submission.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")

load("python/2.7.10")
unload("anaconda-python")
