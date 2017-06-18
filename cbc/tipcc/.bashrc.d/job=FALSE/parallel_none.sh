### Force R to only use a single core when _not_ running as a job
### and unless the user overrides these settings manually.
### This applies to R functions that uses:
###
###  * getOption("mc.cores")
###
### to decide the number of cores to use.
export MC_CORES=1

### Force OpenMP to use a single thread
export OMP_NUM_THREADS=1
