# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Python
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##prependPath /opt/local/bin # Python 2.6.5
if [[ $(using_lmod) -eq 0 ]]; then
  module_load Python
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Anaconda [https://store.continuum.io/cshop/anaconda/],
# which includes Python
# FIXME: We should probably remove Anaconda, because it causes
#        many issues.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
  prependPath /home/shared/cbc/software_cbc/anaconda/bin
  . /home/shared/cbc/bin/pythonpath_update
fi
