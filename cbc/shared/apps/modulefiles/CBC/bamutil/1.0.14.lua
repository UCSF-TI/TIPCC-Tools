help([[
BamUtil: Programs for Working on SAM/BAM Files
]])

local name = "BamUtil"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: http://genome.sph.umich.edu/wiki/BamUtil")
whatis("Description: bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, `bam`. Example: `bam help`.")

load("cbc-devel")
local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bamUtil/bin")
