help([[
BamUtil - programs for working on SAM/BAM files
]])

local name = "BamUtil"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: http://genome.sph.umich.edu/wiki/BamUtil")
whatis("Description: bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, `bam`.")

-- Local variables
local path = "/home/shared/cbc/software_cbc"

prepend_path("PATH", path .. "/" .. name .. "-" .. version .. "/bamUtil/bin")
