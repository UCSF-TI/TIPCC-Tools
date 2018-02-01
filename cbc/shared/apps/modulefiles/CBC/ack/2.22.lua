help([[
ack: A Tool Like Grep, Optimized for Programmers
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ack, ag, git-grep, grep, rg")
whatis("URL: https://beyondgrep.com/, https://beyondgrep.com/feature-comparison/")
whatis("Description: Designed for programmers with large heterogeneous trees of source code, 'ack' is written purely in portable Perl 5 and takes advantage of the power of Perl's regular expressions. Examples: `ack --version` and `ack --man`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH",  home)
