### Force R to only use a single core unless the user overrides
### these settings manually or have requested a job with more cores.
### This applies to R functions that uses:
###
###  * future::availableCores()
###  * future::availableWorkers()
###
### to decide the number of cores to use.
export R_FUTURE_AVAILABLECORES_FALLBACK=1
