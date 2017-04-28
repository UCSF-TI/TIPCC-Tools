help([[
htop - an interactive process viewer for Unix
]])

local name = "htop"
local version = "1.0.3"
whatis("Version: " .. version)
whatis("Keywords: system, utility")
whatis("URL: http://hisham.hm/htop/")
whatis("Description: htop is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
