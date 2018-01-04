help([[
FastQC: A Quality Control Tool for High Throughput Sequence Data
]])

local name = "FastQC"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/")
whatis("Description: A quality control tool for high throughput sequence data. Example: `fastqc --version`.")

local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
