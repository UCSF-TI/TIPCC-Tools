help([[
STAR: Spliced Transcripts Alignment to a Reference
]])

local name = myModuleVersion()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: https://github.com/alexdobin/STAR")
whatis("Description: STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data. Example: `STAR --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/STAR-" .. version .. "/bin/Linux_x86_64"
prepend_path("PATH", home)
