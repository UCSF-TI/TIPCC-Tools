help([[
Java Development Kit (JDK)
]])

local name = "jdk"
local version = "1.8.0"
whatis("Version: " .. version)
whatis("Keywords: programming")
whatis("URL: https://www.java.com/")
whatis("Description: The Java programming language")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. "/bin")
