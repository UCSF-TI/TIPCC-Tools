help([[
json-c: A JSON Implementation in C
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://github.com/json-c/json-c")
whatis("Description: JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C, output them as JSON formatted strings and parse JSON formatted strings back into the C representation of JSON objects. It aims to conform to RFC 7159.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

-- execution
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib"))
-- linking
prepend_path("LD_RUN_PATH", pathJoin(home, "lib"))
-- building
prepend_path("PKG_CONFIG_PATH", pathJoin(home, "lib", "pkgconfig"))
-- prepend_path("CPATH",  pathJoin(home, "include"))
-- prepend_path("CFLAGS", "-I" .. pathJoin(home, "include"), " ")
-- prepend_path("LDFLAGS", "-L" .. pathJoin(home, "lib"), " ")
