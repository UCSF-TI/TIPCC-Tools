help([[
IGV: The Integrative Genomics Viewer
]])

local name = "IGV"
local version = "2.1.2"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://software.broadinstitute.org/software/igv/")
whatis("Description: The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"
local home = cbc_software .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
set_alias("igv", home .. "/igv.sh")
