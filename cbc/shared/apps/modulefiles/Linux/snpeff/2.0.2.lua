help([[
SnpEff
]])

local name = "snpEff"
local version = "2_0_2"
whatis("Version: " .. version)
whatis("Keywords: high-throughput sequencing")
whatis("URL: http://snpeff.sourceforge.net/")
whatis("Description: Genetic variant annotation and effect prediction toolbox.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local path = cbc_software .. "/" .. name .. "_v" .. version
local pathname = path .. "/snpEff.jar"

set_alias("snpEff", "java -jar " .. pathname)

