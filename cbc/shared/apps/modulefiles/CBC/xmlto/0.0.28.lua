help([[
xmlto: Converts an XML File into a Specified Format
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: XML")
whatis("URL: https://directory.fsf.org/wiki/Xmlto")
whatis("Description: 'xmlto' converts an XML file (DocBook or XSL-FO) into a specified format (PS, PDF, HTML, man, ASCII, XSL-FO, etc.). It applies an appropriate XSL-T stylesheet and then performs whatever post-processing is necessary. Examples: `xmlto --version`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH",  home .. "/bin")
prepend_path("MANPATH",  home .. "/share/man")
