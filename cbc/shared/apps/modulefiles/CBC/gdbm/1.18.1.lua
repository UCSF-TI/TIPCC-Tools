help([[
GDBM: Library of Database Function (GNU dbm)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: db, programming")
whatis("URL: https://www.gnu.org.ua/software/gdbm/")
whatis("Description: GNU dbm (or GDBM, for short) is a library of database functions that use extensible hashing and work similar to the standard UNIX dbm. These routines are provided to a programmer needing to create and manipulate a hashed database..  Example: `gdbmtool --version`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

prepend_path("PATH",  pathJoin(home, "/bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "/lib"))
prepend_path("MANPATH",  pathJoin(home, "/share/man"))

prepend_path("LIBRARY_PATH", pathJoin(home, "/lib"))
prepend_path("CPATH",  pathJoin(home, "/include"))

prepend_path("CFLAGS", "-I" .. pathJoin(home, "/include"), " ")
prepend_path("LDFLAGS", "-L" .. pathJoin(home, "/lib"), " ")

