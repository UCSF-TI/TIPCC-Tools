help([[
Modules by CBC
]])

local name = myModuleName()
whatis("Keywords: UCSF, CBC")
whatis("URL: https://github.com/UCSF-TI/TIPCC/wiki/Software-shared-by-CBC")
whatis("Description: Modules shared by CBC.")

local mroot = os.getenv("MODULEPATH_ROOT")
local mpath = pathJoin(mroot, "repos", "." .. name)
prepend_path("MODULEPATH", mpath)
