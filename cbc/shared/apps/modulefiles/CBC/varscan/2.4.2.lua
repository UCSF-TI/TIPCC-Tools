help([[
VarScan: Variant Detection in Massively Parallel Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: high-throughput sequencing")
whatis("URL: https://dkoboldt.github.io/varscan/")
whatis("Description: VarScan is a platform-independent mutation caller for targeted, exome, and whole-genome resequencing data generated on Illumina, SOLiD, Life/PGM, Roche/454, and similar instruments. Example: `java -jar $VARSCAN`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
name = "VarScan"
local home = path .. "/" .. name .. "-" .. version
local jarfile = home .. "/" .. name .. ".v" .. version .. ".jar"
setenv("VARSCAN", jarfile)
set_alias("varscan", "java -jar " .. jarfile)
