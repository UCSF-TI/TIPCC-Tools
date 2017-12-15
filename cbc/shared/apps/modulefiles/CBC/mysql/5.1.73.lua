help([[
MySQL: An Open-source Relational Database Management System (RDBMS)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: database, SQL, RDBMS")
whatis("URL: https://www.mysql.com/")
whatis("Description: MySQL is an open-source relational database management system (RDBMS). Example: `mysql --version`")


local path = "/home/shared/cbc/software_cbc"
local home = path .. "/" .. name .. "-v" .. version .. "-linux-x64"

prepend_path("PATH",  "/usr/bin")
prepend_path("LD_RUN_PATH",  "/usr/lib64/mysql") -- See [1]
prepend_path("LD_LIBRARY_PATH",  "/usr/lib64/mysql")
prepend_path("MANPATH",  home .. "/usr/share/man")


-- REFERENCES:
-- [1] https://dev.mysql.com/doc/refman/5.5/en/environment-variables.html

