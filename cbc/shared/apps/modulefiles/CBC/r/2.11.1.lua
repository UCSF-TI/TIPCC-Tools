help([[
R: The R Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming, Statistics")
whatis("URL: https://www.r-project.org/")
whatis("Description: The R programming language. Example: `R --version` and `Rscript --version`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/R/R-2.11.1-20150918"
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
