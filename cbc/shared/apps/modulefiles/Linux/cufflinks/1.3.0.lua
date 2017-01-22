help([[
Cufflinks: Transcriptome assembly and differential expression analysis for RNA-Seq
]])

local name = "cufflinks"
local version = "1.3.0"
whatis("Version: " .. version)
whatis("Keywords: ")
whatis("URL: http://cole-trapnell-lab.github.io/cufflinks/")
whatis("Description: Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.")

-- Local variables
local cbc_shared = "/home/shared/cbc"
local cbc_software = cbc_shared .. "/software"

prepend_path("PATH", cbc_software .. "/" .. name .. "-" .. version .. ".Linux_x86_64")
