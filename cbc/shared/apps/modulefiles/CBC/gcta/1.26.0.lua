help([[
GCTA: Genome-wide Complex Trait Analysis
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: genome")
whatis("URL: http://cnsgenomics.com/software/gcta/")
whatis("Description: A tool for Genome-wide Complex Trait Analysis (GCTA). Example: `gcta64`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH",  home)
