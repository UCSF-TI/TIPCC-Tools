help([[
MATLAB: The MATLAB Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: Programming")
whatis("URL: https://www.mathworks.com/products/matlab.html")
whatis("Description: MATLAB (MATrix LABoratory) is a multi-paradigm numerical computing environment. Example: `matlab -nosplash -nodisplay -r 'quit'`.")

local home = "/opt/local/MATLAB/R2012a"
prepend_path( "PATH", home .. "/bin")

