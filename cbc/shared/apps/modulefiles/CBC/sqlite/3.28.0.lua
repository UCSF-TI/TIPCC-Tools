help([[
SQLite - A Relational Database Management System (RDBMS) Contained in a C Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, databases")
whatis("URL: https://www.sqlite.org/")
whatis("Description: SQLite is a C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite is built into all mobile phones and most computers and comes bundled inside countless other applications that people use every day. Examples: `sqlite3 --version`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

-- execution
prepend_path("PATH", pathJoin(home, "bin"))
prepend_path("MANPATH", pathJoin(home, "share", "man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib"))
-- linking
prepend_path("LD_RUN_PATH", pathJoin(home, "lib"))
-- building
prepend_path("PKG_CONFIG_PATH", pathJoin(home, "lib", "pkgconfig"))
-- prepend_path("CPATH",  pathJoin(home, "include"))
-- prepend_path("CFLAGS", "-I" .. pathJoin(home, "include"), " ")
-- prepend_path("LDFLAGS", "-L" .. pathJoin(home, "lib"), " ")
