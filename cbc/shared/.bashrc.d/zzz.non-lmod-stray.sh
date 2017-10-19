export PICARD_HOME=${SHARED_SOFTWARE}/picard-tools-latest
export GATK_HOME=${SHARED_SOFTWARE}/GATK-latest

## TODO: Replace these aliases with warnings
## to use 'module load r/x.y.z instead.
alias R-2.15.3=${SHARED_SOFTWARE}/R-2.15.3/bin/R
alias R-3.0.0=${SHARED_SOFTWARE}/R-3.0.0/bin/R
alias R-3.0.1=${SHARED_SOFTWARE}/R-3.0.1/bin/R
alias R-3.0.2=${SHARED_SOFTWARE}/R-3.0.2/bin/R
alias R-3.0.3=${SHARED_SOFTWARE}/R-3.0.3/bin/R
alias R-3.1.0=${SHARED_SOFTWARE}/R-3.1.0/bin/R
alias R-3.1.1=${SHARED_SOFTWARE}/R-3.1.1/bin/R
alias R-3.1.2=${SHARED_SOFTWARE}/R-3.1.2/bin/R
alias R-3.1.3=${SHARED_SOFTWARE}/R-3.1.3/bin/R
alias R-3.2.0=${SHARED_SOFTWARE}/R-3.2.0/bin/R
alias R-3.2.1=${SHARED_SOFTWARE}/R-3.2.1/bin/R
alias R-3.2.3=${SHARED_SOFTWARE}/R-3.2.3/bin/R
alias R-3.3.0=${SHARED_SOFTWARE}/R-3.3.0/bin/R
alias R-3.3.1=${SHARED_SOFTWARE}/R-3.3.1/bin/R
alias R-3.3.2=${SHARED_SOFTWARE}/R-3.3.2/bin/R
alias R-3.3.3=${SHARED_SOFTWARE}/R-3.3.3/bin/R
alias R-latest=${SHARED_SOFTWARE}/R-latest/bin/R
alias R-patched=${SHARED_SOFTWARE}/R-patched/bin/R
alias R-devel=${SHARED_SOFTWARE}/R-devel/bin/R
## TODO: Update useR to give a warning
## to use 'module load r/x.y.z instead.
alias useR=". ${SHARED_ROOT}/bin/useR"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Miscellaneous
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Mirror website
alias wmirror="wget --no-host-directories --recursive --no-parent --reject='index.html*'"
