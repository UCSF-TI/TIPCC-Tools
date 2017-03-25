help([[
Samtools
]])

local name = "htslib"
local version = "1.3.2"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://www.htslib.org/")
whatis("Description: Samtools is a suite of programs for interacting with high-throughput sequencing data. It consists of three separate repositories: Samtools, BCFtools, and HTSlib.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")
prepend_path("LD_LIBRARY_PATH", cbc_software .. "/" .. name .. "-" .. version .. "/lib")
