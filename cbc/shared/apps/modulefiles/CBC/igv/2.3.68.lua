help([[
IGV: The Integrative Genomics Viewer
]])

-- local name = myModuleName()
local name = "IGV"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: https://software.broadinstitute.org/software/igv/")
whatis("Description: The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations. Example: `igv`.")

depends_on("jdk")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "_" .. version
prepend_path("PATH", home)
set_alias("igv", home .. "/igv.sh")
