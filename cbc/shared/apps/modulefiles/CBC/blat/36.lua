help([[
BLAT: Standalone BLAT - fast sequence search command line tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, alignment")
whatis("URL: http://genome.ucsc.edu/goldenPath/help/blatSpec.html")
whatis("Description: BLAT - client and server combined into a single program, first building the index, then using the index, and then exiting. Example: `blat`")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software_cbc"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
