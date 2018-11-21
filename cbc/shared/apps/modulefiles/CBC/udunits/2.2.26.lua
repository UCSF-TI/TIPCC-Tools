help([[
UDUNITS-2: API and Utility for Arithmetic Manipulation of Units of Physical Quantities 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: library, programming")
whatis("URL: https://www.unidata.ucar.edu/software/udunits/")
whatis("Description: The UDUNITS package supports units of physical quantities. Its C library (libudunits2) provides for arithmetic manipulation of units and for conversion of numeric values between compatible units.  The package contains an extensive unit database, which is in XML format and user-extendable. The package also contains a command-line utility (udunits2) for investigating units and converting values.  Example: `udunits2 -h`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

prepend_path("PATH",  pathJoin(home, "/bin"))

-- If you ever happen to want to link against installed libraries
-- in a given directory, LIBDIR, you must either use libtool, and
-- specify the full pathname of the library, or use the `-LLIBDIR'
-- flag during linking and do at least one of the following:
--    - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
--      during execution
--    - add LIBDIR to the `LD_RUN_PATH' environment variable
--      during linking
--    - use the `-Wl,-rpath -Wl,LIBDIR' linker flag

prepend_path("LD_LIBRARY_PATH", pathJoin(home, "/lib"))
prepend_path("LD_RUN_PATH", pathJoin(home, "/lib"))
prepend_path("LIBRARY_PATH", pathJoin(home, "/lib"))
prepend_path("CPATH",  pathJoin(home, "/include"))
