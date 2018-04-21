help([[
Python: The Python Programming Language
]])

-- local name = myModuleName()
local name = "Python"
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.python.org/")
whatis("Description: Python is a programming language that lets you work quickly and integrate systems more effectively.  Example: `python --version` as well as `virtualenv myproject`, `. myproject/bin/activate`, and `pip install cnvkit`.")

depends_on("openssl", "libpng", "bzip2", "pcre", "xz", "zlib")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version

prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("MANPATH", home .. "/share/man")

-- No need to set PYTHONPATH; take care of automatically
-- prepend_path("PYTHONPATH", home .. "/lib/python3.6")
