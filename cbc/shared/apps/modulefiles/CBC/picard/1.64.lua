help([[
Picard: Command-line tools for Manipulating High-throughput Sequencing Data and Formats
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://broadinstitute.github.io/picard/")
whatis("Description: Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.  Example: `java -jar $PICARD_HOME/ViewSam.jar --version`")

load("jdk")

local path = "/home/jocostello/tools"
local home = path .. "/" .. name .. "-tools-" .. version
setenv("PICARD_HOME", home)
