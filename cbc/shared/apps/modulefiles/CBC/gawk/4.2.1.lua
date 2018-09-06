help([[
gawk: Effective AWK Programming (GNU awk)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: utility")
whatis("URL: https://www.gnu.org/software/gawk/")
whatis("Description: AWK is a programming language designed for text processing and typically used as a data extraction and reporting tool.  Example: `gawk --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LD_LIBRARY_PATH", home .. "/lib/gawk")

-- used by GCC compiler/linker
prepend_path("CPATH", home .. "/include")
prepend_path("LIBRARY_PATH", home .. "/lib/gawk")
