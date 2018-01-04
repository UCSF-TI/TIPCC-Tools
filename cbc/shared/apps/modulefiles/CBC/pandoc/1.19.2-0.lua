help([[
Pandoc - a universal document converter
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: documentation, conversion")
whatis("URL: http://pandoc.org/")
whatis("Description: Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library.")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")

