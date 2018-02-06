help([[
zlib: A Massively Spiffy Yet Delicately Unobtrusive Compression Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: compression")
whatis("URL: https://www.zlib.net/")
whatis("Description: zlib is designed to be a free, general-purpose, legally unencumbered -- that is, not covered by any patents -- lossless data-compression library for use on virtually any computer hardware and operating system. The zlib data format is itself portable across platforms.  Not related to the Linux zlibc compressing file-I/O library.  Example: No executable; only a library.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LIBRARY_PATH", home .. "/lib")
prepend_path("PKG_CONFIG_PATH", home .. "/lib/pkgconfig")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("CPATH", home .. "/include")
