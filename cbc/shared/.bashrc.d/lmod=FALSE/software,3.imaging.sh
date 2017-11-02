# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Imaging tools
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
    prependPath ${SHARED_SOFTWARE}/Fiji-latest
fi    
