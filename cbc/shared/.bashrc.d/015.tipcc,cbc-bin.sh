# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SHARED SOFTWARE
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
    prependPath ${SHARED_ROOT}/bin
    prependPath ${SHARED_ROOT}/local/bin
fi

