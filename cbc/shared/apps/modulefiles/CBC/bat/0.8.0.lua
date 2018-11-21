help([[
bat - A cat(1) clone with syntax highlighting and Git integration
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: utility, file viewer")
whatis("URL: https://github.com/sharkdp/bat")
whatis("Description: A cat(1) clone with syntax highlighting and Git integration.  Examples: `bat README.md`, `bat scripts/*.sh`, and `bat src/*.c`")

-- Local variables
local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

prepend_path("PATH", home)
