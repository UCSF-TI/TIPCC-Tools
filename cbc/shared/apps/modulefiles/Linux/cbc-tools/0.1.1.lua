help([[
CBC Tools
]])

local name = "cbc-tools"
local version = "0.1.1"
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: https://github.com/UCSF-TI/TIPCC/wiki/Software-shared-by-CBC")
whatis("Description: CBC Tools setup via modules.")

load("cbc-bin")

-- load("pcre")

-- load("git")
-- load("curl")
-- load("pcre")
-- load("wget")
-- load("tar")
-- load("zlib")
-- load("emacs")

load("python")
load("anaconda")
load("anaconda-python")

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
-- load("valgrind") ## Because it adds /usr/bin/ to PATH
load("jdk")
load("matlab")
load("r")
prepend_path("R_LIBS_SITE", "/home/shared/cbc/R/site-library/%p-library/%v")
load("udocker")
