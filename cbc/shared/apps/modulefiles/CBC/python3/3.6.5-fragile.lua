help([[
Python 3: The Python Programming Language (WARNING: Does NOT pass all tests!)
]])

local name = "Python"
local version = "3.6.5"
-- local name = myModuleName()
-- local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.python.org/")
whatis("Description: Python is a programming language that lets you work quickly and integrate systems more effectively.  Example: `python3 --version` as well as `virtualenv myproject`, `. myproject/bin/activate`, and `pip install cnvkit`.  WARNING: The python3/3.6.5 module is fragile - the build does NOT pass all tests. Use at your own risk! See https://github.com/UCSF-TI/TIPCC/issues/259 for details.")

-- "openssl" not available
depends_on("libpng", "bzip2", "pcre", "xz", "zlib")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version

prepend_path("PATH", home .. "/bin")
prepend_path("LD_LIBRARY_PATH", home .. "/lib")
prepend_path("MANPATH", home .. "/share/man")

-- No need to set PYTHONPATH; taken care of automatically
-- prepend_path("PYTHONPATH", home .. "/lib/python3.6")

if (mode() == "load") then
  io.stderr:write("WARNING: The python3/3.6.5 module is fragile - the build does NOT pass all tests. Use at your own risk! See https://github.com/UCSF-TI/TIPCC/issues/259 for details.\n")
end
