help([[
Git extension Git Flow
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: https://github.com/nvie/gitflow")
whatis("Description: A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.")

local path = "/home/shared/cbc/software_cbc"
prepend_path("PATH", path .. "/" .. name .. "-" .. version .. "/bin")
