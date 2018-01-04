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
local home = path .. "/" .. name .. version .. "_latest"
prepend_path("JAVA_HOME", home)
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/man")
