help([[
CBC Tools
]])

local name = "cbc-tools"
local version = "0.2.0"
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: https://github.com/UCSF-TI/TIPCC/wiki/Software-shared-by-CBC")
whatis("Description: CBC Tools setup via modules. Version >= 0.2.0 does *not* load Anaconda.")

local cbc_python = os.getenv("CBC_PYTHON")

load("cbc-bin")

-- load("pcre")
-- load("curl")
-- load("pcre")
-- load("wget")
-- load("tar")
-- load("zlib")
-- load("emacs")

load("python")

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

prepend_path("R_LIBS_SITE", "/home/shared/cbc/R/site-library/%p-library/%v")
