help([[
Git: Distributed Version Control System
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: https://git-scm.com/")
whatis("Description: Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. Example: `git --version`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
