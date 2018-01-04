help([[
Amazon S3 Tools: Command Line S3 Client Software and S3 Backup
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://s3tools.org/s3cmd")
whatis("Description: ommand Line S3 Client and Backup for Linux and Mac")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
set_alias("s3cmd", home .. "/s3cmd")

