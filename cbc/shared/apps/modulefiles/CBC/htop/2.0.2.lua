help([[
htop: An Interactive Process Viewer for Unix
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: system, utility")
whatis("URL: http://hisham.hm/htop/")
whatis("Description: `htop` is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses. Example: `htop`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version

prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
