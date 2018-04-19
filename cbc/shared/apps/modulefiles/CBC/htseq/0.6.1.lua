help([[
HTSeq: Analysing high-throughput sequencing data with Python
]])

local name = "HTSeq"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: http://www-huber.embl.de/users/anders/HTSeq/")
whatis("Description: HTSeq is a Python package that provides infrastructure to process data from high-throughput sequencing assays. Example: `htseq-count` and `htseq-qa`.")

depends_on("anaconda")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/scripts")
