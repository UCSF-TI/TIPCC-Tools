help([[
HTSlib: C Library for High-Throughput Sequencing Data Formats
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, programming")
whatis("URL: http://www.htslib.org/")
whatis("Description: HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.  Example: `bgzip --version`, `htsfile --version`, and `tabix --version`.")

load("cbc-devel")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("C_INCLUDE_PATH",  home .. "/include")
prepend_path("MANPATH", home .. "/share/man")
