help([[
Ruby: The Ruby Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://www.ruby-lang.org/en/")
whatis("Description: Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro 'Matz' Matsumoto in Japan.  Example: `ruby --version` and `irb`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

prepend_path("PATH", pathJoin(home, "bin"))
prepend_path("MANPATH", pathJoin(home, "share/man"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib"))
prepend_path("PKG_CONFIG_PATH", pathJoin(home, "lib/pkgconfig"))
--prepend_path("CPATH",  pathJoin(home, "include/ruby-2.5.0"))