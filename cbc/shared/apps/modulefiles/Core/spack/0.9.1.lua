help([[
Spack: the Supercomputing Package Manager

Usage:
spack <command> <options>

Example:
spack info samtools
spack install samtools
spack install samtools@1.2
]])

local name = "spack"
local version = "0.9.1"
whatis("Version: " .. version)
whatis("Keywords: sysadm")
whatis("URL: https://spack.readthedocs.io/")
whatis("GitHub: https://github.com/llnl/spack")
whatis("Description: Spack is a package management tool designed to support multiple versions and configurations of software on a wide variety of platforms and environments. It was designed for large supercomputing centers, where many users and application teams share common installations of software on clusters with exotic architectures, using libraries that do not have a standard ABI. Spack is non-destructive: installing a new version does not break existing installations, so many configurations can coexist on the same system.")

-- Use this compiler
local apps = "/home/shared/cbc/apps"
local home = pathJoin(apps, name)

setenv("SPACK_ROOT", home)
prepend_path("PATH", pathJoin(home, "bin"))



