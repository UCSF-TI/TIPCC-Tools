help([[
GCC, the GNU Compiler Collection
]])

local name = "gcc"
local version = "4.8.4"
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://gcc.gnu.org/")
whatis("Description: Sets up your environment to make use of the GCC " .. version .. " compilers and all of the software compiled based on them.  The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, and Go, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system.")

-- Use this compiler
local apps = "/home/shared/cbc/apps"
local home = pathJoin(apps, name, version)
prepend_path("PATH", pathJoin(home, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib64"))
prepend_path("MANPATH", pathJoin(home, "share", "man"))

-- Setup Modulepath for packages built by this compiler
-- (http://lmod.readthedocs.io/en/latest/080_hierarchy.html)
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot, "Compiler/gcc", "4.9")
prepend_path("MODULEPATH", mdir)
