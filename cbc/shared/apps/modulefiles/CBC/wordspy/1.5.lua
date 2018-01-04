help([[
WordSpy: A Steganalysis-based, Genome Scale Motif Finding Method
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://www.cs.wustl.edu/~zhang/")
whatis("Description: A steganalysis-based approach to comprehensive identification and characterization of functional regulatory elements. Example: `wordspy`.")

local path = "/opt/local/bin/"
local home = path .. "/" .. name .. version
prepend_path("PATH", home)
