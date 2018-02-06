help([[
libpng: The Official Portable Network Graphics Reference Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: library, PNG")
whatis("URL: http://www.libpng.org/pub/png/libpng.html")
whatis("Description: libpng is the official PNG reference library. It supports almost all PNG features, is extensible, and has been extensively tested for over 22 years. Example: no executable; a library. Example: `libpng16-config --version`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LIBRARY_PATH", home .. "/lib")
prepend_path("PKG_CONFIG_PATH", home .. "/lib/pkgconfig")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("CPATH", home .. "/include")
