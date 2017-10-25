help([[
CBC-shared Software: Default Set
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: https://github.com/UCSF-TI/TIPCC/wiki/Software-shared-by-CBC")
whatis("Description: When loaded, this module loads the default set of CBC-shared software.  This replaces and is backward compatible with the deprecated usage of `source /home/shared/cbc/bashrc`.")

local cbc_python = os.getenv("CBC_PYTHON")

load("cbc-bin")

-- load("pcre")
-- load("curl")
-- load("pcre")
-- load("wget")
-- load("tar")
-- load("zlib")
-- load("emacs")

-- WORKAROUND: The default CBC-shared setup is such that Anaconda's Python
-- installation comes before the system one.  Env variable CBC_PYTHON=cbc
-- allows us to swap the order.  This can be set in ~/.bashrc or ~/.tipccrc.
-- References:
-- * https://github.com/UCSF-TI/TIPCC-sysadm/issues/81
-- * https://github.com/UCSF-TI/TIPCC/issues/110
if (os.getenv("CBC_PYTHON") == "cbc") then
  load("anaconda")
  load("anaconda-python")
  load("python")
else
  load("python")
  load("anaconda")
  load("anaconda-python")
end

if (os.getenv("CBC_DEVEL") ~= "false") then
  load("cbc-devel")
end

load("git")
load("gitflow")

load("bamutil")
load("bedops")
load("bedtools2")
load("blast")
load("bowtie2")
load("bwa")
load("control-freec")
load("cufflinks")
load("fastqc")
load("genetorrent")
load("htseq")
load("sratoolkit")
load("samtools")
load("bcftools")
load("tophat")
load("vcftools")
load("wordspy")
load("igvtools")
load("igv")
load("htslib")
load("htop")
load("pandoc")
load("s3cmd")
-- load("valgrind") -- Because it adds /usr/bin/ to PATH
load("jdk")
load("matlab")
load("r")
load("fiji")
load("udocker")

load("ruby/2.2.0p0")

prepend_path("R_LIBS_SITE", "/home/shared/cbc/R/site-library/%p-library/%v")

