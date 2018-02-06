help([[
GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: editor, text")
whatis("URL: https://www.gnu.org/software/emacs/")
whatis("Description: At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing. Example: `emacs --version` and `emacs -nw`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")

