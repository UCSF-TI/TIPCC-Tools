help([[
Module Repository by CBI (Computational Biology and Informatics - formerly CBC)
]])

local name = myModuleName()
local mroot = os.getenv("MODULEPATH_ROOT")
local mpath = pathJoin(mroot, name)

whatis("Keywords: UCSF, CBI, CBC")
whatis("URL: http://cbi.ucsf.edu/")
whatis("Description: Repository of modules shared by the Computational Biology and Informatics (http://cbi.ucsf.edu/) which was named Computational Biology Core (CBC) until 2017. When loading this module, you will get access to a large number of software modules.  When unloading the module, any software modules from this " .. name .. " repository still loaded when you unload this repository module, will remain in your list of loaded modules but will be inactivate (i.e. behave as they never were loaded) until you reload this repository module again.  Example: `module load CBC` and then `module avail`.")

prepend_path("MODULEPATH", mpath)
