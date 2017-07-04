help([[
Module Repository by CBC (Computational Biology Core)
]])

local name = myModuleName()
local mroot = os.getenv("MODULEPATH_ROOT")
local mpath = pathJoin(mroot, name)

whatis("Keywords: UCSF, CBC")
whatis("URL: http://cbc.ucsf.edu/")
whatis("Description: Repository of modules shared by the Computational Biology Core (http://cbc.ucsf.edu). When loading this module, your `MODULEPATH` will be extended and you will get access to a large number of additional modules. When unloading the module, the changes to `MODULEPATH` will be undone. Note that any modules from the " .. name .. " repository still loaded when you unload this repository module, will remain in your list of loaded modules but will be inactivate (i.e. behave as they never were loaded) until you reload this repository module again.")

prepend_path("MODULEPATH", mpath)
