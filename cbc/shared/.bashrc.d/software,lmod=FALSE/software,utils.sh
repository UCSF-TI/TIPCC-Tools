if [[ $(using_lmod) -eq 0 ]]; then
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # SOFTWARE: System tools
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    prependPath ${SHARED_SOFTWARE}/htop-latest

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # SOFTWARE: Text tools
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    prependPath ${SHARED_SOFTWARE}/pandoc-latest/bin
fi
