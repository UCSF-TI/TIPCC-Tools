help([[
JAGS: Just Another Gibbs Sampler
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: statistics")
whatis("URL: http://mcmc-jags.sourceforge.net/")
whatis("Description: JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation  not wholly unlike BUGS.. Example: `jags` and `man jags`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. string.upper(name) .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("PKG_CONFIG_PATH", home .. "/lib/pkgconfig")
