help([[
pip - The PyPA recommended tool for installing Python packages
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: python, utility")
whatis("URL: https://pypi.python.org/pypi/pip")
whatis("Description: The PyPA recommended tool for installing Python packages.")

load("spack-gcc-4.9.2")
load("python")
load("py-appdirs")
load("py-packaging")
load("py-pyparsing")
load("py-setuptools")
load("py-six")
load("py-pip")


