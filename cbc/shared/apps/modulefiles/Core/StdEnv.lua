load("spack-gcc-4.9.2")

-- Default compiler tools
-- load("gcc/4.9.2")

unload("binutils")
unload("python")
load("gcc/5.4.0")
load("binutils")
load("python")

-- Spack installed packages
-- NOTE: Don't enable by default until we know it works
-- load("spack-gcc-4.9.2")

