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

setenv("PICARD_HOME", "/home/shared/cbc/software/picard-tools-latest")
setenv("GATK_HOME", "/home/shared/cbc/software/GenomeAnalysisTK-latest")
setenv("LG3_HOME", "/home/henrik/projects/CostelloJ_2014-LG3-Exome-Pipeline/pbs")

prepend_path("R_LIBS_SITE", "/home/shared/cbc/R/site-library/%p-library/%v")

----------------------------------------------------------
-- Interactive mode only
----------------------------------------------------------
local is_interactive = not not os.getenv("PS1")
if (is_interactive) then
  -- 'll' is already created in the sitewide setup
  set_alias("lll", "ls -la")
  
  -- Cluster tools
  set_alias("ganglia", "lynx -accept_all_cookies http://localhost/ganglia/")
  -- ## set_alias("gmem", 'free -g | echo "      `head -1`"; gsh free -g | egrep -e "Mem"')
  set_alias("gswap", 'free -g | echo "      `head -1`"; gsh free -g | egrep -e "Swap"')
  set_alias("gmem", "gsh vmstatmem")
  set_alias("topme", "top -U ${USER}")
  set_alias("htopme", "htop -u ${USER}")
  set_alias("psme", "ps -ef | grep ${USER}")
  
  -- Easy login to each node
  for kk=1,30 do
    set_alias("n" .. kk, "pwd=$(pwd); ssh -Y -t n" .. kk .. " \"cd $pwd; $SHELL\"")
  end

  -- Never use /usr/libexec/openssh/gnome-ssh-askpass
  unsetenv("SSH_ASKPASS")

  -- Set EDITOR is unset
  local editor = os.getenv("EDITOR")
  if (not editor or editor == "") then
    setenv("EDITOR", "emacs -nw")
  end
end
