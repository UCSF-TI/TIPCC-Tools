help([[
Nextflow: Data-driven Computational Pipelines
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: workflow")
whatis("URL: https://www.nextflow.io/")
whatis("Description: Nextflow enables scalable and reproducible scientific workflows using software containers. It allows the adaptation of pipelines written in the most common scripting languages. Its fluent DSL simplifies the implementation and the deployment of complex parallel and reactive workflows on clouds and clusters. Example: `nextflow -version`.")

load("jdk")  -- Requires Java (>= 8)

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version

prepend_path("PATH", home)
