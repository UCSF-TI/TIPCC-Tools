help([[
vcf-validator - Validation suite for Variant Call Format (VCF) files
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: https://github.com/EBIvariation/vcf-validator")
whatis("Description: Validator for the Variant Call Format (VCF) implemented using C++11. It includes all the checks from the vcftools suite, and some more that involve lexical, syntactic and semantic analysis of the VCF input.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
prepend_path("PATH", cbc_shared .. "/software_cbc/" .. name .. "-" .. version)
