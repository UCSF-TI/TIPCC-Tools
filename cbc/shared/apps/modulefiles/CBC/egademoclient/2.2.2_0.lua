help([[
EgaDemoClient: The European Genome-phenome Archive (EGA) Download Client
]])

local name = myModuleVersion()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: download")
whatis("URL: https://www.ebi.ac.uk/ega/about/your_EGA_account/download_streaming_client")
whatis("Description: The EgaDemoClient application can be used as an interactive shell or direct command line client.  Both methods provide similar functionality, but you may only use the FUSE layer option from the command line. Example: `EgaDemoClient --help` alias for `java -jar $EGADEMOCLIENT_HOME/EgaDemoClient.jar --help`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/EgaDemoClient-" .. version

setenv("EGADEMOCLIENT_HOME", home)
set_alias("EgaDemoClient", "java -jar " .. home .. "/EgaDemoClient.jar")
