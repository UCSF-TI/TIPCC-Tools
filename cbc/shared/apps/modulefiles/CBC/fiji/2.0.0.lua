help([[
Fiji: an Image Processing Package
]])

local name = "Fiji"
local version = "2.0.0-rc-54"
whatis("Version: " .. version)
whatis("Keywords: image analysis")
whatis("URL: https://imagej.net/Fiji/Downloads")
whatis("Description: Fiji is a \"batteries-included\" distribution of ImageJ, bundling a lot of plugins which facilitate scientific image analysis. Example: `ImageJ-linux64 --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
