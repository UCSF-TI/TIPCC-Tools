help([[
CBC-shared Developer's Environment
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, configure, build, compile, install")
whatis("URL: http://cbi.ucsf.edu/")
whatis("Description: Setup for building and installing software inline with the CBI-shared setup (formerly CBC-shared setup).")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local gcc_home
local t


-- (a) Development, e.g. gcc
gcc_home = "/opt/gcc/gcc-4.9.2"
pushenv("GCC_HOME", gcc_home)
prepend_path("PATH", gcc_home .. "/bin")
prepend_path("LD_LIBRARY_PATH", gcc_home .. "/lib64")


-- (b) BUILDS:
-- ./configure --prefix=${SHARED_ROOT}/local/
-- make
prepend_path("C_INCLUDE_PATH", "/home/shared/cbc/local/include")  -- e.g. bcftools
prepend_path("LIBRARY_PATH", "/home/shared/cbc/local/lib")  -- e.g. bcftools
-- make install
t = os.getenv("CPPFLAGS")
if t == nil then t = "" end
pushenv("CPPFLAGS", "-I/home/shared/cbc/local/include " .. t)
t = os.getenv("LDFLAGS")
if t == nil then t = "" end
pushenv("LDFLAGS", "-L/home/shared/cbc/local/lib " .. t)
prepend_path("LD_LIBRARY_PATH", "/home/shared/cbc/local/lib")


-- (c) R Project
t = os.getenv("PKG_LIBS")
--  Fixes "/usr/bin/ld: cannot find -lgfortran" error when
--  building package that needs libgfortran.
--  FIXME: Should this be configured already when building R, i.e.
--         in /home/shared/cbc/bin/installR? /HB 2015-01-10
if t == nil then t = "" end
pushenv("PKG_LIBS", t .. " -L" .. gcc_home)
-- 'nc-config' needs to be on the PATH in order to install R package ncdf4
append_path("PATH", "/opt/NetCDF/NetCDF-4.3.0/bin")
