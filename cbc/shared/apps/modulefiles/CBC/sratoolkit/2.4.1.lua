help([[
SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://ncbi.github.io/sra-tools/")
whatis("GitHub: https://github.com/ncbi/sra-tools")
whatis("Description: The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives. Example: `fastq-dump --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "." .. version .. "-centos_linux64"
prepend_path("PATH", home .. "/bin")
