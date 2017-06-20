help([[
udocker
]])

local name = "udocker"
local version = "1.0.0"
whatis("Version: " .. version)
whatis("Keywords: Linux, containers")
whatis("URL: https://github.com/indigo-dc/udocker")
whatis("Description: A basic user tool to execute simple containers in batch or interactive systems without root privileges.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

set_alias("udocker", "udocker.py")
prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
