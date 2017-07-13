help([[
SnpEff - Genetic Variant Annotation and Effect Prediction Toolbox
]])

local name = "snpEff"
local version = "2.0.2"
whatis("Version: " .. version)
whatis("Keywords: high-throughput sequencing")
whatis("URL: http://snpeff.sourceforge.net/")
whatis("Description: SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes).")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local path = cbc_software .. "/" .. name .. "-" .. version
local pathname = path .. "/snpEff.jar"

set_alias("snpEff", "java -jar " .. pathname)

