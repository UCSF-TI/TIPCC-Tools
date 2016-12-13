From http://lmod.readthedocs.io/en/latest/080_hierarchy.html

> Our modulefile hierarchy is stored under `/opt/apps/modulefiles/{Core,Compiler,MPI}`. The Core directory is for modules that are not dependent on Compiler or MPI implementations. The Compiler directory is for packages which are only Compiler dependent. Lastly, the MPI directory is packages which dependent on MPI-Compiler pairing. The modulefiles for the compilers are placed in the Core directory. For example the gcc version 4.9.2 file is in Core/gcc/4.9.2.lua and contains:

```lua
-- Setup Modulepath for packages built by this compiler
local mroot = os.getenv("MODULEPATH_ROOT")
local mdir  = pathJoin(mroot, "Compiler/gcc", "4.9")
prepend_path("MODULEPATH", mdir)
```
