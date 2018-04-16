help([[
Bowtie: A Fast and Sensitive Gapped Read Aligner
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://bowtie-bio.sourceforge.net/index.shtml")
whatis("Description: Bowtie is an ultrafast, memory-efficient short read aligner. _NOTE: This is Bowtie v1 - not v2_.  Example: `bowtie --version`")

load("python")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
