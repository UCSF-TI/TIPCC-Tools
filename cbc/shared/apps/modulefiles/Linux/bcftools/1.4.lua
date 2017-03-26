help([[
BCFtools: utilities for variant calling and manipulating VCFs and BCFs
]])

local name = "bcftools"
local version = "1.4"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://samtools.github.io/bcftools/bcftools.html")
whatis("Description: BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
setenv("BCFTOOLS_PLUGINS", home .. "/" .. "plugins")

