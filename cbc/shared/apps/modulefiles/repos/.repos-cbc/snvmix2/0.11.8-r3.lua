help([[
SNVMix2
]])

local name = "snvmix2"
local version = "0.11.8-r3"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://compbio.bccrc.ca/software/snvmix/")
whatis("Description: SNVMix is designed to detect single nucleotide variants from next generation sequencing data. SNVMix is a post-alignment tool.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local path cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", path)
