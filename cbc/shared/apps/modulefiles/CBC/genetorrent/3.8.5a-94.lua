help([[
GeneTorrent: Tools for Accessing Data in the Cancer Genomics Hub (CGHub)
]])

local name = "GeneTorrent"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://hpc.nih.gov/apps/GeneTorrent.html")
whatis("Description: GeneTorrent is a set of executables for accessing data in the Cancer Genomics Hub (CGHub), a secure repository for storing, cataloging, and accessing cancer genome sequences, alignments, and mutation information from the Cancer Genome Atlas (TCGA) consortium and related projects. Example: `cgquery --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
