# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Python
#
# Anaconda [https://store.continuum.io/cshop/anaconda/], includes
# Python.
# FIXME: We should probably remove Anaconda, because it causes
#        many issues.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [[ $(using_lmod) -eq 0 ]]; then
  if [[ "$CBC_PYTHON" = "cbc" ]]; then
      prependPath /home/shared/cbc/software_cbc/anaconda/bin
      module_load Python
      . /home/shared/cbc/bin/pythonpath_update
  else
    module_load Python
    prependPath /home/shared/cbc/software_cbc/anaconda/bin
    . /home/shared/cbc/bin/pythonpath_update
  fi
fi
