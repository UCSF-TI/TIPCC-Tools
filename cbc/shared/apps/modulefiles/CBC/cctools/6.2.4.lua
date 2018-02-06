help([[
cctools: Cooperative Computing Tools contains Parrot, Chirp, Makeflow, Work Queue, SAND, and other software.
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: library, compression")
whatis("URL: http://ccl.cse.nd.edu/software/")
whatis("Description:  The Cooperative Computing Tools (cctools) contains Parrot, Chirp, Makeflow, Work Queue, SAND, and other software.  Example: `parrot_run --version`, `parrot_run more /http/cbi.ucsf.edu`, and `parrot_run emacs /chirp/server.nd.edu/file.txt`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version .. "-x86_64-redhat6"
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LIBRARY_PATH", home .. "/lib")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("CPATH", home .. "/include")
