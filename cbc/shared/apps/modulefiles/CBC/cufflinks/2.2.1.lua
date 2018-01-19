help([[
Cufflinks: Transcriptome Assembly and Differential Expression Analysis for RNA-Seq
]])

local name = myModuleName()
local version = myModuleVersion()
whatis("Version: " .. version)
whatis("Keywords: sequencing")
whatis("URL: http://cole-trapnell-lab.github.io/cufflinks/")
whatis("Description: Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols. Example: `cufflinks`.")

local path = os.getenv("SOFTWARE_ROOT_CBC")
local home = path .. "/" .. name .. "-" .. version .. ".Linux_x86_64"
prepend_path("PATH", home)
