help([[
Ruby: The Ruby Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, scripting")
whatis("URL: https://www.ruby-lang.org/en/")
whatis("Description: Ruby is a dynamic, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro 'Matz' Matsumoto in Japan.  Example: `ruby --version`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path
prepend_path("PATH", home .. "/bin")
