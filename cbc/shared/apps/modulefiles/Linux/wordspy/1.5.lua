help([[
WordSpy
]])

local name = "wordspy"
local version = "1.5"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://cic.cs.wustl.edu/wordspy/dltemp.htm")
whatis("Description: A steganalysis-based approach to comprehensive identification and characterization of functional regulatory elements.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
