help([[
ASCIIGenome: Text Only Genome Viewer!
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, viewer")
whatis("URL: https://github.com/dariober/ASCIIGenome")
whatis("Description: ASCIIGenome is a genome browser based on command line interface and designed for running from console terminals. Since ASCIIGenome does not require a graphical interface it is particularly useful for quickly visualizing genomic data on remote servers while offering flexibility similar to popular GUI viewers like IGV.  Example: `ASCIIGenome --help`.")

load("jdk")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. "ASCIIGenome" .. "-" .. version
prepend_path("PATH", home)

