help([[
Picard: Command-line tools for Manipulating High-throughput Sequencing Data and Formats
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://broadinstitute.github.io/picard/")
whatis("Description: Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.  Example: `java -jar $PICARD -h`")

load("jdk")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
setenv("PICARD", home .. "/picard.jar")
