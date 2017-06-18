help([[
Modules in ~/modulefiles/
]])

whatis("Description: Personal modules in ~/modulefiles/, if any.")

local home = os.getenv("HOME")
local mpath = pathJoin(home, "modulefiles")
prepend_path("MODULEPATH", mpath)
