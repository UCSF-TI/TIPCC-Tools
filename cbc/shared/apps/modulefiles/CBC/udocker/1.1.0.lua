help([[
udocker
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Linux, containers, LXC")
whatis("URL: https://github.com/indigo-dc/udocker")
whatis([[Description: A basic user tool to execute simple docker containers in user space without requiring root privileges. Enables basic download and execution of docker containers by non-privileged users in Linux systems where docker is not available. It can be used to access and execute the content of docker containers in Linux batch systems and interactive clusters that are managed by other entities such as grid infrastructures or externally managed batch or interactive systems.

The INDIGO udocker does not require any type of privileges nor the deployment of services by system administrators. It can be downloaded and executed entirely by the end user.

udocker is a wrapper around several tools to mimic a subset of the docker capabilities including pulling images and running them with minimal functionality.]])

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software_cbc"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
