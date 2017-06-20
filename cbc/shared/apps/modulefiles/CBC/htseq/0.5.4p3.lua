help([[
HTSeq: Analysing high-throughput sequencing data with Python
]])

local name = "HTSeq"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: http://www-huber.embl.de/users/anders/HTSeq/")
whatis("Description: HTSeq is a Python package that provides infrastructure to process data from high-throughput sequencing assays.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/scripts")
