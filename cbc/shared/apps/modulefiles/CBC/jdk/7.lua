help([[
JDK: Java Development Kit
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://www.java.com/")
whatis("Description: The Java programming language. Examples: `java -version` and `javac -version`.")

local path = "/opt/java"
local home = path .. "/" .. name .. "1.7.0" .. "_latest"
setenv("JAVA_HOME", home)
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")
prepend_path("LD_LIBRARY_PATH", home .. "/jre/lib/amd64/server")
