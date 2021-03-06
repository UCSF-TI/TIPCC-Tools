help([[
libevent: An Event Notification Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: library, development")
whatis("URL: http://libevent.org/, https://github.com/libevent/libevent")
whatis("Description: The libevent API provides a mechanism to execute a callback function when a specific event occurs on a file descriptor or after a timeout has been reached. Furthermore, libevent also support callbacks due to signals or regular timeouts. Example: `event_rpcgen.py`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("CPATH", home .. "/include")
prepend_path("LIBRARY_PATH", home .. "/lib")
