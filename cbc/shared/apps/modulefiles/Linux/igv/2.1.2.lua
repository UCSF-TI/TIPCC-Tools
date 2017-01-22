help([[
IGV: The Integrative Genomics Viewer
]])

local name = "IGV"
local version = "2.3.31"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://software.broadinstitute.org/software/igv/")
whatis("Description: The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"
local path = cbc_software .. "/" .. name .. "_" .. version
-- prepend_path("PATH", path)
set_alias("igv", path .. "/igv.sh")

