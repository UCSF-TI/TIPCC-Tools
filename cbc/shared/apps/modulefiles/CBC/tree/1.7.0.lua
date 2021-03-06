help([[
tree: List Content of Directories in a Tree-like Format
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: files, utility")
whatis("URL: http://mama.indstate.edu/users/ice/tree/")
whatis("Description: Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the `LS_COLORS` environment variable is set and output is to tty.. Example: `tree --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")
