help([[
Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, genome")
whatis("URL: https://software.broadinstitute.org/gatk/")
whatis("Description: Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.  Example: `gatk --help`.")

load("jdk")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH",  home)
