help([[
CBC-shared Software: Default Set
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: UCSF, cluster, utilities")
whatis("URL: https://ucsf-ti.github.io/tipcc-web/software/software-repositories.html")
whatis("Description: When loaded, this module loads the default set of CBC-shared software.  See `module show cbc-shared` for details.")

local cbc_python = os.getenv("CBC_PYTHON")

-- From old /home/shared/cbc/bashrc
append_path("PATH", "~/bin")

load("cbc-bin")

-- load("pcre")
-- load("curl")
-- load("pcre")
-- load("wget")
-- load("tar")
-- load("zlib")
-- load("emacs")

load("anaconda")
load("anaconda-python")
-- Site-wide Python is now prioritized / HB 2018-01-08
-- * https://github.com/UCSF-TI/TIPCC-sysadm/issues/81
load("python")

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

local path=os.getenv("SOFTWARE_ROOT_CBC")
setenv("PICARD_HOME", path .. "/picard-tools-1.67")
load("gatk/3.8.0")
setenv("LG3_HOME", "/home/henrik/projects/CostelloJ_2014-LG3-Exome-Pipeline/pbs")

----------------------------------------------------------
-- R
----------------------------------------------------------
prepend_path("R_LIBS_SITE", "/home/shared/cbc/R/site-library/%p-library/%v")

-- DEPRECATED
local versions = {"2.15.3", "3.0.0", "3.0.1", "3.0.2", "3.0.3", "3.1.0",
                   "3.1.1", "3.1.2", "3.1.3", "3.2.0", "3.2.1", "3.2.3",
                   "3.3.0", "3.3.1", "3.3.2", "3.3.3",
                   "latest", "patched", "devel"}
for i, vv in pairs(versions) do
  set_alias("R-" .. vv, "tput setaf 3; >&2 echo \"WARNING: alias R-" .. vv .. " is deprecated - instead use module load r/" .. vv .."\"; tput sgr0; ${SHARED_SOFTWARE}/R-" .. vv .. "/bin/R")
end


-- DEPRECATED
set_alias("wmirror", "tput setaf 3; >&2 echo \"WARNING: wmirror is deprecated\"; tput sgr0; wget --no-host-directories --recursive --no-parent --reject='index.html*'")
 

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
  for kk=0,29 do
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


-- From old /home/shared/cbc/bashrc
setenv("CLUSTER_SCHEDULER", "TORQUE")
setenv("CLUSTER_HEADNODE", "cclc01")
setenv("CLUSTER_NODES", "n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 n29")
