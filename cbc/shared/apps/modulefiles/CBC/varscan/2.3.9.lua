help([[
VarScan
]])

local name = "VarScan"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: high-throughput sequencing")
whatis("URL: http://dkoboldt.github.io/varscan/")
whatis("Description: Variant detection in massively parallel sequencing data")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local path = cbc_software .. "/" .. name .. "-" .. version
local pathname = path .. "/" .. name .. ".v" .. version .. ".jar"
set_alias("varscan", "java -jar " .. pathname)
-- prepend_path("PATH", path)
