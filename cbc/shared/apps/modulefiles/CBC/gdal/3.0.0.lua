help([[
GDAL: Geospatial Data Abstraction Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://gdal.org/, https://github.com/OSGeo/gdal")
whatis("Description: GDAL is an open source X/MIT licensed translator library for raster and vector geospatial data formats. Example: `gdalinfo --version`")

depends_on("curl")
depends_on("geos")
depends_on("libpng")
depends_on("netcdf")
depends_on("pcre")
depends_on("proj")
depends_on("xz")
depends_on("zlib")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

-- execution
prepend_path("PATH", pathJoin(home, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib"))
-- linking
prepend_path("LD_RUN_PATH", pathJoin(home, "lib"))
-- building
prepend_path("CPATH",  pathJoin(home, "include"))
prepend_path("CFLAGS", "-I" .. pathJoin(home, "include"), " ")
prepend_path("LDFLAGS", "-L" .. pathJoin(home, "lib"), " ")
