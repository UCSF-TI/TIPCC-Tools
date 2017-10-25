if [[ $(using_lmod) -eq 1 ]]; then
  for vv in 2.15.3 3.0.0 3.0.1 3.0.2 3.0.3 3.1.0 3.1.1 3.1.2 3.1.3 3.2.0 3.2.1 3.2.3 3.3.0 3.3.1 3.3.2 3.3.3 latest patched devel; do
    eval "alias R-${vv}='tput setaf 3; echo "WARNING: alias R-${vv} is deprecated - instead use module load r/${vv}"; tput sgr0; ${SHARED_SOFTWARE}/R-${vv}/bin/R'"
  done
  alias useR=". ${SHARED_ROOT}/bin/useR"
  
  # Mirror website
  alias wmirror="tput setaf 3; echo 'WARNING: \"wmirror\" is deprecated'; tput sgr0; wget --no-host-directories --recursive --no-parent --reject='index.html*'"
fi
