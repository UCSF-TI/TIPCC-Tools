help([[
SNVMix2: Detecting Single Nucleotide Variants from Next Generation Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing, genomics")
whatis("URL: http://shahlab.ca/projects/snvmix/")
whatis("Description: SNVMix is designed to detect single nucleotide variants from next generation sequencing data. SNVMix is a post-alignment tool. Example: `SNVMix2 -h`.")

local path = "/opt/local"
name = "SNVMix2"
local home = path .. "/" .. name .. "-" .. version
prepend_path("PATH", home)
