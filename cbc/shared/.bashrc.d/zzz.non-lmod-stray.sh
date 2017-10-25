# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Aliases
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
  for vv in 2.15.3 3.0.0 3.0.1 3.0.2 3.0.3 3.1.0 3.1.1 3.1.2 3.1.3 3.2.0 3.2.1 3.2.3 3.3.0 3.3.1 3.3.2 3.3.3 latest patched devel; do
    eval "alias R-${vv}='${SHARED_SOFTWARE}/R-${vv}/bin/R'"
  done
  alias useR=". ${SHARED_ROOT}/bin/useR"
else
  for vv in 2.15.3 3.0.0 3.0.1 3.0.2 3.0.3 3.1.0 3.1.1 3.1.2 3.1.3 3.2.0 3.2.1 3.2.3 3.3.0 3.3.1 3.3.2 3.3.3 latest patched devel; do
    eval "alias R-${vv}='tput setaf 3; echo "WARNING: alias R-${vv} is deprecated - instead use module load r/${vv}"; tput sgr0; ${SHARED_SOFTWARE}/R-${vv}/bin/R'"
  done
  alias useR=". ${SHARED_ROOT}/bin/useR"
fi

# Mirror website
alias wmirror="wget --no-host-directories --recursive --no-parent --reject='index.html*'"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Useful env vars
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export PICARD_HOME=${SHARED_SOFTWARE}/picard-tools-latest
export GATK_HOME=${SHARED_SOFTWARE}/GATK-latest
## Costello Lab specific
export LG3_HOME=/home/henrik/projects/CostelloJ_2014-LG3-Exome-Pipeline/pbs

