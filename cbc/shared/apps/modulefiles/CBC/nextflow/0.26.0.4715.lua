help([[
Nextflow - Data-driven computational pipelines
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: workflow")
whatis("URL: https://www.nextflow.io/")
whatis("Description: Nextflow enables scalable and reproducible scientific workflows using software containers. It allows the adaptation of pipelines written in the most common scripting languages. Its fluent DSL simplifies the implementation and the deployment of complex parallel and reactive workflows on clouds and clusters.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software_cbc"

load("jdk")  -- Requires Java (>= 8)
prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version)
