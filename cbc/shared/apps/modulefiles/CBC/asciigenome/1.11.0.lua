help([[
ASCIIGenome - Text Only Genome Viewer!
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, viewer")
whatis("URL: https://github.com/dariober/ASCIIGenome")
whatis("Description: ASCIIGenome is a genome browser based on command line interface and designed for running from console terminals. Since ASCIIGenome does not require a graphical interface it is particularly useful for quickly visualizing genomic data on remote servers while offering flexibility similar to popular GUI viewers like IGV.")

load("jdk")

local software_root = "/home/shared/cbc/software_cbc"
local home = software_root .. "/" .. "ASCIIGenome" .. "-" .. version
prepend_path("PATH", home)

