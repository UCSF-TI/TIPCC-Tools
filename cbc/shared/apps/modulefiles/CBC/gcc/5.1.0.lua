help([[
GCC, the GNU Compiler Collection
]])

local name = "gcc"
local version = "5.1.0"
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://gcc.gnu.org/")
whatis("Description: The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, and Go, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system. Example: `gcc --version`.")

local path = "/opt/gcc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib64")
prepend_path("MANPATH", home .. "/share/man")
-- CMake needs these to find the correct version of GCC
setenv("CC", pathJoin(home, "bin/gcc"))
setenv("CXX", pathJoin(home, "bin/g++"))
