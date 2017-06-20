help([[
Git extension Git Flow
]])

local name = "gitflow"
local version = "0.4.2"
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: https://github.com/nvie/gitflow")
whatis("Description: A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")
