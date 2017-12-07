help([[
Links: A Lynx-like Alternative Character Mode WWW Browser
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: internet, browser")
whatis("URL: http://links.twibright.com/features.php")
whatis("Description: Links runs in text mode (mouse optional) on UN*X console, ssh/telnet virtual terminal, vt100 terminal, xterm, and virtually any other text terminal. Mouse is supported for GPM, xterm, and OS/2. Links supports colors on terminal. Example: `links https://www.google.com/`.")

load("cbc-devel")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")
