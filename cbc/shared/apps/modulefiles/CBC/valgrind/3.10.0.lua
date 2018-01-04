help([[
Valgrind - a programming tool for memory debugging, memory leak detection, and profiling
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: http://www.valgrind.org/")
whatis("Description: Valgrind is a programming tool for memory debugging, memory leak detection, and profiling.")

local path = "/home/shared/cbc/software_cbc"
prepend_path( "PATH", path .. "/" .. name .. "-" .. version .. "/bin")
