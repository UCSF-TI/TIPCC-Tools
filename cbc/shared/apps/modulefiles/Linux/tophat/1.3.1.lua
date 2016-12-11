help([[
TopHat
]])

local name = "tophat"
local version = "1.3.1"
whatis("Version: " .. version)
whatis("Keywords: Programming, Statistics")
whatis("URL: https://ccb.jhu.edu/software/tophat/index.shtml")
whatis("Description: TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version .. ".Linux_x86_64"
prepend_path("PATH", home)
