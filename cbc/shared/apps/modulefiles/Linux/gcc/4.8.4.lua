help([[
GCC, the GNU Compiler Collection
]])

local name = "gcc"
local version = "4.8.4"
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://gcc.gnu.org/")
whatis("Description: The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, and Go, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib64")
prepend_path("MANPATH", home .. "/share/man")
