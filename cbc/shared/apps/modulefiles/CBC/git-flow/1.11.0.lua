help([[
git-flow: Git Extension Git Flow (AVH Edition)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: version control")
whatis("URL: https://github.com/petervanderdoes/gitflow-avh, https://github.com/nvie/gitflow")
whatis("Description: A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model. Example: `git flow`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-avh-" .. version
prepend_path("PATH", home)
