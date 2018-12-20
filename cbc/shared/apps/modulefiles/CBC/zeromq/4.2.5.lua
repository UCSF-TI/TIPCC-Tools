help([[
ZeroMQ: A High-Performance Asynchronous Messaging Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: library")
whatis("URL: https://zeromq.org/")
whatis("Description: ZeroMQ is a high-performance asynchronous messaging library, aimed at use in distributed or concurrent applications. It provides a message queue, but unlike message-oriented middleware, a ZeroMQ system can run without a dedicated message broker. The library's API is designed to resemble that of Berkeley sockets. Example: `curve_keygen`")

local root = os.getenv("SOFTWARE_ROOT_CBC")
local home = root .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("LD_RUN_PATH", home .. "/lib")
prepend_path("PKG_CONFIG_PATH", home .. "/lib/pkgconfig")
prepend_path("CPATH", home .. "/include")
