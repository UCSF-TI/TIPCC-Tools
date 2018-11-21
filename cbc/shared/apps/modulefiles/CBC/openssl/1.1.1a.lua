help([[
OpenSSL: Cryptography and SSL/TLS Toolkit 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: db, dbi, sql")
whatis("URL: https://www.openssl.org/")
whatis("Description: OpenSSL is a robust, commercial-grade, and full-featured toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols. It is also a general-purpose cryptography library.  Example: `openssl`")


local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = pathJoin(path, name .. "-" .. version)

prepend_path("PATH",  pathJoin(home, "/bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "/lib"))
prepend_path("PKG_CONFIG_PATH", pathJoin(home, "/lib/pkgconfig"))
prepend_path("MANPATH",  pathJoin(home, "/man"))

prepend_path("LIBRARY_PATH", pathJoin(home, "/lib"))
prepend_path("CPATH",  pathJoin(home, "/include"))

prepend_path("CFLAGS", "-I" .. pathJoin(home, "/include"), " ")
prepend_path("LDFLAGS", "-L" .. pathJoin(home, "/lib"), " ")

-- non-official
-- setenv("OPENSSL_HOME",  home)
