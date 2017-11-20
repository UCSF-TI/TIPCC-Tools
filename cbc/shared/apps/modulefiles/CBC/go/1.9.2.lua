help([[
The Go Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: programming, language, Go")
whatis("URL: https://golang.org/")
whatis("Description: Go is a cross-platform open-source programming language that makes it easy to build simple, reliable, and efficient software. Example: `go version`")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software_cbc"

local goroot = cbc_software .. "/" .. name .. "-" .. version
setenv("GOROOT", goroot)
prepend_path("PATH", goroot .. "/bin")

local gopath = os.getenv("HOME") .. "/go"
setenv("GOPATH", gopath)
prepend_path("PATH", gopath .. "/bin")
