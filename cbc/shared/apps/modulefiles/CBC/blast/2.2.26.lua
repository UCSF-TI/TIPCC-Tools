help([[
BLAST: Basic Local Alignment Search Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://blast.ncbi.nlm.nih.gov/Blast.cgi")
whatis("Description: BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein	sequences to sequence databases and calculates the statistical significance. Example: `blastx -version`")

local path = "/opt/local/bin"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
