help([[
Singularity
]])

local name = "singularity"
local version = "2.2"
whatis("Version: " .. version)
whatis("Keywords: Linux, containers")
whatis("URL: http://singularity.lbl.gov/")
whatis("GitHub: https://github.com/singularityware/singularity")
whatis("Description: Singularity enables users to have full control of their environment. This means that a non-privileged user can 'swap out' the operating system on the host for one they control. So if the host system is running RHEL6 but your application runs in Ubuntu, you can create an Ubuntu image, install your applications into that image, copy the image to another host, and run your application on that host in it's native Ubuntu environment!")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"
local home = pathJoin(cbc_software, name .. "-" .. version)

prepend_path("PATH", pathJoin(home, "bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(home, "lib"))
