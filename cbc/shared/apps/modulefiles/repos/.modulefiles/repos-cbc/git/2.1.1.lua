help([[
Git - distributed version control system
]])

local name = "git"
local version = "2.1.1"
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: https://git-scm.com/")
whatis("Description: Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
