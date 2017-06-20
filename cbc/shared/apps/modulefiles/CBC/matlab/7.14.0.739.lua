help([[
The Matlab Programming Language
]])

local name = myModuleName()
local version = "R2012a"
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.mathworks.com/products/matlab.html")
whatis("Description: The Matlab programming language")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path( "PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")
