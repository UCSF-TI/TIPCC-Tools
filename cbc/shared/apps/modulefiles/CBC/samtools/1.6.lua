help([[
SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://www.htslib.org/")
whatis("Description: SAMtools is a suite of programs for interacting with high-throughput sequencing data.  Example: `samtools --version`.")

load("cbc-devel")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version

prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")

