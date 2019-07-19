help([[
PROJ - Cartographic Projections and Coordinate Transformations Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://proj.org/, https://github.com/OSGeo/PROJ")
whatis("Description: PROJ is a generic coordinate transformation software, that transforms coordinates from one coordinate reference system (CRS) to another. This includes cartographic projections as well as geodetic transformations.  Examples: `geod` and `proj`.")

depends_on("sqlite")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

-- execution
prepend_path("PATH", pathJoin(home, "bin"))
prepend_path("MANPATH", pathJoin(home, "share", "man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib"))
-- linking
prepend_path("LD_RUN_PATH", pathJoin(home, "lib"))
-- building
prepend_path("PKG_CONFIG_PATH", pathJoin(home, "lib", "pkgconfig"))
prepend_path("CPATH",  pathJoin(home, "include"))
prepend_path("CFLAGS", "-I" .. pathJoin(home, "include"), " ")
prepend_path("LDFLAGS", "-L" .. pathJoin(home, "lib"), " ")
prepend_path("LIBS", "-L" .. pathJoin(home, "lib"), " ")
-- AD HOC: Needed by install.packages("rgdal") in R
prepend_path("PKG_LIBS", "-L" .. pathJoin(home, "lib"), " ")
