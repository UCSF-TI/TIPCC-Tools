help([[
Bowtie2
]])

local name = "bowtie2"
local version = "2.0.0-beta6"
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml")
whatis("Description: Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
