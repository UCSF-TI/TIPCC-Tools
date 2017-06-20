help([[
GeneTorrent
]])

local name = "GeneTorrent"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://hpc.nih.gov/apps/GeneTorrent.html")
whatis("Description: GeneTorrent is a set of executables for accessing data in the Cancer Genomics Hub (CGHub), a secure repository for storing, cataloging, and accessing cancer genome sequences, alignments, and mutation information from the Cancer Genome Atlas (TCGA) consortium and related projects.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"
local path = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", path .. "/bin")
prepend_path("MANPATH", path .. "/share/man")
