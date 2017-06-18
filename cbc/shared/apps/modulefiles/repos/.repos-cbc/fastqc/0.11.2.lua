help([[
FastQC
]])

local name = "FastQC"
local version = "0.11.2"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/")
whatis("Description: A quality control tool for high throughput sequence data.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
