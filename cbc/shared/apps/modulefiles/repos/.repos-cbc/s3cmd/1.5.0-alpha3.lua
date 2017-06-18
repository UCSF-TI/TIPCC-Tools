help([[
Amazon S3 Tools: Command Line S3 Client Software and S3 Backup
]])

local name = "s3cmd"
local version = "1.5.0-alpha3"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://s3tools.org/s3cmd")
whatis("Description: ommand Line S3 Client and Backup for Linux and Mac")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local path = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", path)
set_alias("s3cmd", path .. "/s3cmd")

