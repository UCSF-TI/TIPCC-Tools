help([[
Modules in ~/modulefiles/
]])

local name = myModuleName()
whatis("Description: Personal modules in `~/modulefiles/` (created if missing).  For instance, module definition file `~/modulefiles/foo/1.0.lua` provides module foo/1.0, which can be loaded using `module load foo/1.0`.  For example of module files, see the many modules under /home/shared/cbc/apps/modulefiles/CBC/.")

local home = os.getenv("HOME")
local mpath = pathJoin(home, "modulefiles")
os.execute("mkdir -p " .. mpath)
prepend_path("MODULEPATH", mpath)
