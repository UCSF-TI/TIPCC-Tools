help([[
CBC-shared Developer's Environment
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, configure, build, compile, install")
whatis("URL: https://cbc.ucsf.edu/")
whatis("Description: Setup for building and installing software inline with the CBC-shared setup.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local t;

-- Development, e.g. gcc
if mode() == "load" then
  pushenv("GCC_HOME", "/opt/gcc/gcc-4.9.2")
  t = os.getenv("GCC_HOME")
  if t ~= null then
    prepend_path("PATH", t .. "/bin")
    prepend_path("LD_LIBRARY_PATH", t .. "/lib64")
  end
end

-- BUILDS:
-- ./configure --prefix=${SHARED_ROOT}/local/
-- make
-- make install
if mode() == "load" then
    local t = os.getenv("CPPFLAGS")
    if t == nil then
      t = ""
    end
    pushenv("CPPFLAGS", "-I/home/shared/cbc/local/include " .. t)
    t = os.getenv("LDFLAGS")
    if t == nil then
      t = ""
    end
    pushenv("LDFLAGS", "-L/home/shared/cbc/local/lib " .. t)
end
prepend_path("LD_LIBRARY_PATH", "/home/shared/cbc/local/lib")

-- R:
-- Fixes "/usr/bin/ld: cannot find -lgfortran" error when
-- building package that needs libgfortran.
-- FIXME: Should this be configured already when building R, i.e.
--        in /home/shared/cbc/bin/installR? /HB 2015-01-10
--append_path("PKG_LIBS", export PKG_LIBS="${PKG_LIBS} -L${GCC_HOME}"

-- 'nc-config' needs to be on the PATH in order to install R package ncdf4
--appendPath /opt/NetCDF/NetCDF-4.3.0/bin
