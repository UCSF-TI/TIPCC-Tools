help([[
CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: development, make")
whatis("URL: https://cmake.org/")
whatis("Description: CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries. Example: `cmake --version`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version .. "-Linux-x86_64"
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")
