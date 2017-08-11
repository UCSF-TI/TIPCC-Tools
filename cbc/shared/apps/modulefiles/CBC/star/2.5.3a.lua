help([[
STAR - Spliced Transcripts Alignment to a Reference
]])

local name = myModuleVersion()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: https://github.com/alexdobin/STAR")
whatis("Description: STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

-- Setting an command-line alias
-- set_alias("foo", "echo 'Foo!'")

prepend_path("PATH", cbc_software .. "/STAR-" .. version .. "/bin/Linux_x86_64")
