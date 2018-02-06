help([[
curl: Command Line Tool and Library for Transferring Data with URLs
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: files, internet, download")
whatis("URL: https://curl.haxx.se/, https://github.com/curl/curl")
whatis("Description: cURL is a computer software project providing a library and command-line tool for transferring data using various protocols. The cURL project produces two products, libcurl and cURL. It was first released in 1997. The name originally stood for \"see URL\".  Example: `curl --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LIBRARY_PATH", home .. "/lib")
prepend_path("PKG_CONFIG_PATH", home .. "/lib/pkgconfig")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("CPATH", home .. "/include")
