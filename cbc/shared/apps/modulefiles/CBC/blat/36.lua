help([[
BLAT: Standalone BLAT - Fast Sequence Search Command Line Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, alignment")
whatis("URL: http://genome.ucsc.edu/goldenPath/help/blatSpec.html")
whatis("Description: BLAT - client and server combined into a single program, first building the index, then using the index, and then exiting. Example: `blat`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
