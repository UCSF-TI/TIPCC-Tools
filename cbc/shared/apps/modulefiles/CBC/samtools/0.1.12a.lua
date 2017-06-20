help([[
Samtools
]])

local name = "samtools"
local version = "0.1.12a"
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://www.htslib.org/")
whatis("Description: Samtools is a suite of programs for interacting with high-throughput sequencing data. It consists of three separate repositories.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
prepend_path("PATH", home .. "bcftools")
prepend_path("PATH", home .. "misc")
