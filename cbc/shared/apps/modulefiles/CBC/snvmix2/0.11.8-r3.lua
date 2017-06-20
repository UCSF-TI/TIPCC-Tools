help([[
SNVMix2 - Detecting Single Nucleotide Variants from Next Generation Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, genomics")
whatis("URL: http://compbio.bccrc.ca/software/snvmix/")
whatis("Description: SNVMix is designed to detect single nucleotide variants from next generation sequencing data. SNVMix is a post-alignment tool.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"
local path = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", path)
