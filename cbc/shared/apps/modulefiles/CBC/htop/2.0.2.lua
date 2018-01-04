help([[
htop - an interactive process viewer for Unix
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: system, utility")
whatis("URL: http://hisham.hm/htop/")
whatis("Description: `htop` is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses. Example: `htop`")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version .. "/bin"
prepend_path("PATH", home)
