help([[
udocker: Execute Simple Docker Containers Without Root Privileges
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Linux, containers, LXC")
whatis("URL: https://github.com/indigo-dc/udocker")
whatis("Description: A basic user tool to execute simple containers in batch or interactive systems without root privileges. Example: `udocker help`.")

-- Local variables
local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
set_alias("udocker", "udocker.py")
