help([[
AsciiDoc: Text Based Document Generation
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: ack, ag, git-grep, grep, rg")
whatis("URL: http://asciidoc.org/")
whatis("Description: AsciiDoc is a text document format for writing notes, documentation, articles, books, ebooks, slideshows, web pages, man pages and blogs. AsciiDoc files can be translated to many formats including HTML, PDF, EPUB, man page. Examples: `asciidoc.py --version`")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH",  home)
