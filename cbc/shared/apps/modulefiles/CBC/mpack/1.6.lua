help([[
mpack: Tools for Encoding/Decoding MIME Messages
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: mime, email")
whatis("URL: https://packages.debian.org/sid/mail/mpack")
whatis("Description: Mpack and munpack are utilities for encoding and decoding (respectively) binary files in MIME (Multipurpose Internet Mail Extensions) format mail messages. For compatibility with older forms of transferring binary files, the munpack program can also decode messages in split-uuencoded format.  Example: `munpack -ft < one-msg.mbox`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home .. "/bin")
prepend_path("MANPATH", home .. "/share/man")
