help([[
udocker
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Linux, containers, LXC")
whatis("URL: https://github.com/indigo-dc/udocker")
whatis("Description: A basic user tool to execute simple containers in batch or interactive systems without root privileges.")

-- Local variables
local path = "/home/shared/cbc/software_cbc"
prepend_path("PATH", path .. "/" .. name .. "-" .. version)
set_alias("udocker", "udocker.py")
