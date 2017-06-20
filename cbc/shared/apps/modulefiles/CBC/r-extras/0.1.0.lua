help([[
R Extras: Additional software, libraries and include paths needed to build some R / Bioconductor packages
]])

local name = "r-extras"
local version = "0.1.0"
whatis("Version: " .. version)
whatis("Keywords: R, Bioconductor")
whatis("Description: Additional software, libraries and include paths needed to build some R / Bioconductor packages")

load("r")      -- spack install r
load("gsl")    -- spack install gsl

load("zlib")
load("cairo")

-- FIXME: This is not enough :( /HB 2017-02-03
load("boost")  -- spack install boost, e.g. Bioconductor flowCore
-- prepend_path("CPPFLAGS", '-I' + os.getenv('CPATH', ''))

-- load("pcre")
-- load("git")
-- load("curl")
-- load("wget")
-- load("tar")
