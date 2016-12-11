help([[
Burrows-Wheeler Aligner (BWA)
]])

local name = "bwa"
local version = "0.7.5a"
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://bio-bwa.sourceforge.net/")
whatis("Description: Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
