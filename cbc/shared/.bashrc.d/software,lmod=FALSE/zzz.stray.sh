# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Aliases
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
    for vv in 2.15.3 3.0.0 3.0.1 3.0.2 3.0.3 3.1.0 3.1.1 3.1.2 3.1.3 3.2.0 3.2.1 3.2.3 3.3.0 3.3.1 3.3.2 3.3.3 latest patched devel; do
	eval "alias R-${vv}='${SHARED_SOFTWARE}/R-${vv}/bin/R'"
    done
    alias useR=". ${SHARED_ROOT}/bin/useR"

    # Mirror website
    alias wmirror="wget --no-host-directories --recursive --no-parent --reject='index.html*'"
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Useful env vars
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
    export PICARD_HOME=${SHARED_SOFTWARE}/picard-tools-latest
    export GATK_HOME=${SHARED_SOFTWARE}/GenomeAnalysisTK-latest
    ## Costello Lab specific
    export LG3_HOME=/home/henrik/projects/CostelloJ_2014-LG3-Exome-Pipeline/pbs
fi
