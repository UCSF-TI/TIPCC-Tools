help([[
The R Programming Language
]])

local name = "R"
local version = "3.3.1"
whatis("Version: " .. version)
whatis("Keywords: Programming, Statistics")
whatis("URL: https://www.r-project.org/")
whatis("Description: The R programming language")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

-- Setting an command-line alias
-- set_alias("foo", "echo 'Foo!'")

prepend_path( "PATH",           cbc_software .. "/R-" .. version .. "/bin")
