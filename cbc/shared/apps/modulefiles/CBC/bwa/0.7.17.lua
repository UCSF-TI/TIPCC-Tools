help([[
BWA: Alignment via Burrows-Wheeler Transformation
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://bio-bwa.sourceforge.net/")
whatis("Description: Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.  Example: `bwa`")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
prepend_path("MANPATH", home)
