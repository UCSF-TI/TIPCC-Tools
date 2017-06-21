help([[
Fiji - an Image Processing Package
]])

local name = "Fiji"
local version = "2.0.0-rc-54"
whatis("Version: " .. version)
whatis("Keywords: image analysis")
whatis("URL: https://imagej.net/Fiji/Downloads")
whatis("Description: Fiji is a \"batteries-included\" distribution of ImageJ, bundling a lot of plugins which facilitate scientific image analysis.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
