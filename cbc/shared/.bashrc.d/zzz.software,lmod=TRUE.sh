## mecho MODULEPATH=$(echo $MODULEPATH | tr : '\n')
if [[ $(using_lmod) -eq 1 ]]; then
    module load cbc-tools
fi
