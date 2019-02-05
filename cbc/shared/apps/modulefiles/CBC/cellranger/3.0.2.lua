help([[
Cell Ranger - 10x Genomics Pipeline for Single-Cell Data Analysis
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, 10x genomics")
whatis("URL: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger")
whatis("Description: Cell Ranger is a set of analysis pipelines that perform sample demultiplexing, barcode processing, and single cell 3' gene counting. Also includes the ability to process data from Feature Barcoding technology.  Reference files are available in the folder given by environment variable `CELLRANGER_REFERENCES`.  Example: `cellranger` and `ls $CELLRANGER_REFERENCES/`")

load("jdk")
load("bcl2fastq")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version .. "-" .. "patched")
prepend_path("PATH",  home)

-- TIPCC specific:
setenv("CELLRANGER_REFERENCES",  "/cbc/shared/resources/cellranger")
