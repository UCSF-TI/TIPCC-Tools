help([[
BLAST: Basic Local Alignment Search Tool
]])

local name = "blast"
local version = "2.2.26"
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://blast.ncbi.nlm.nih.gov/Blast.cgi")
whatis("Description: BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein	sequences to sequence databases and calculates the statistical significance.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
