help([[
Pandoc - a universal document converter
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: documentation, conversion")
whatis("URL: http://pandoc.org/")
whatis("Description: Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")

