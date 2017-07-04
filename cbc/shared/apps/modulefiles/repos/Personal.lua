help([[
Modules in ~/modulefiles/
]])

whatis("Description: Personal modules in `~/modulefiles/`.  For instance, module definition file `~/modulefiles/foo/1.0.lua` provides module foo/1.0, which can be loaded using `module load foo/1.0`.")

local home = os.getenv("HOME")
local mpath = pathJoin(home, "modulefiles")
prepend_path("MODULEPATH", mpath)
