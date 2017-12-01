help([[
BCFtools: utilities for variant calling and manipulating VCFs and BCFs
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://samtools.github.io/bcftools/bcftools.html")
whatis("Description: BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.  Example: `bcftools --version`")

load("cbc-devel")

-- Local variables
local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
setenv("BCFTOOLS_PLUGINS", home .. "/" .. "plugins")

