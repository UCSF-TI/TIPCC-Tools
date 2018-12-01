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

load("python/2.7.15")

if (os.getenv("CBC_DEVEL") ~= "false") then
  load("cbc-devel")
end

load("git")
load("git-flow")

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


----------------------------------------------------------
-- R
----------------------------------------------------------
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
  for kk=0,32 do
    set_alias("n" .. kk, "pwd=$(pwd); ssh -Y -t n" .. kk .. " \"cd $pwd; $SHELL\"")
  end

  -- Never use /usr/libexec/openssh/gnome-ssh-askpass
  unsetenv("SSH_ASKPASS")

  -- Set EDITOR is unset
  local value = os.getenv("EDITOR")
  if (not value or value == "") then
    setenv("EDITOR", "emacs -nw")
  end
end


-- From old /home/shared/cbc/bashrc
setenv("CLUSTER_SCHEDULER", "TORQUE")
setenv("CLUSTER_HEADNODE", "cclc01")
setenv("CLUSTER_NODES", "n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 n29 n30 n31 n32")
