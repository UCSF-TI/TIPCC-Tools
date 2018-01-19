help([[
SnpEff: Genetic Variant Annotation and Effect Prediction Toolbox
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: high-throughput sequencing")
whatis("URL: http://snpeff.sourceforge.net/")
whatis("Description: SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes). Example: `java -jar $SNPEFF -help`.")

load("jdk")

local path = "/home/jocostello/tools"
local name = "snpEff"
local version = "2_0_2"
local home = path .. "/" .. name .. "_v" .. version
local jarfile = home .. "/snpEff.jar"
setenv("SNPEFF", jarfile)
set_alias("snpEff", "java -jar " .. jarfile)

