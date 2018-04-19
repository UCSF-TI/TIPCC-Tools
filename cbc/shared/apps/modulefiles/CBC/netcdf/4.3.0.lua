help([[
NetCDF: Network Common Data Form
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, library")
whatis("URL: https://www.unidata.ucar.edu/software/netcdf/, https://github.com/Unidata/netcdf-c")
whatis("Description: NetCDF is a set of software libraries and self-describing, machine-independent data formats that support the creation, access, and sharing of array-oriented scientific data. Example: `nc-config --version` and `ncdump --version`.")

local path = "/opt/NetCDF"
local home = path .. "/NetCDF-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")

prepend_path("PKG_CONFIG_PATH", home .. "/lib/pkgconfig")

-- used by ./configure
prepend_path("CFLAGS", "-I" .. home .. "/include", " ")
prepend_path("LDFLAGS", "-L" .. home .. "/lib", " ")

-- used by GCC compiler/linker
prepend_path("CPATH", home .. "/include")
prepend_path("LIBRARY_PATH", home .. "/lib")
