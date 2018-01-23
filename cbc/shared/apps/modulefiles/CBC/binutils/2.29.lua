help([[
binutils: GNU Binutils
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: version control, git")
whatis("URL: https://www.gnu.org/software/binutils/")
whatis("Description: The GNU Binutils are a collection of binary tools. The main ones are: `ld` (the GNU linker) and `as` (the GNU assembler). Example: `ld -v`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
