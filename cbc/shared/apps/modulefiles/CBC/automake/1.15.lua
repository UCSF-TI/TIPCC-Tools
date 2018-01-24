help([[
automake: Tool for Automatically Generating GNU-compliant Makefile.in Files
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: development")
whatis("URL: https://www.gnu.org/software/automake/")
whatis("Description: Automake is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards. Example: `automake --version`.")

load("autoconf")
local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
