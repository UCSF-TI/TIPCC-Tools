help([[
ShellCheck - A shell script static analysis tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, shell, sh, bash, dash, ksh")
whatis("URL: https://www.shellcheck.net/")
whatis("Description: ShellCheck finds bugs in your shell scripts.  Example: `shellcheck --version` and `shellcheck -x ~/.bashrc`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
