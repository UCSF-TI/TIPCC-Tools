# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Python
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##prependPath /opt/local/bin # Python 2.6.5
prependPath ${SHARED_SOFTWARE}/Python-2.7.4/bin


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Anaconda [https://store.continuum.io/cshop/anaconda/],
# which includes Python
# FIXME: We should probably remove Anaconda, because it causes
#        many issues.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## Prepare such that only users with ~/.cbc.anaconda will
## add the CBC-shared installation to their paths
if [[ -f "~/.cbc.anaconda" ]]; then
   prependPath /home/shared/cbc/software_cbc/anaconda/bin
else
   prependPath /home/shared/cbc/software_cbc/anaconda/bin
fi

PYTHON_VERSION=$(python -c 'import sys; print("%s.%s" % (sys.version_info[0], sys.version_info[1]));')
PYTHON_HOME=$(which python)

if test "${PYTHONPATH_SYSTEM}" == ""; then
  export PYTHONPATH_SYSTEM=${PYTHONPATH}
fi
export PYTHONPATH=${PYTHONPATH_SYSTEM}

# Add user-specific Python binaries
dir=${HOME}/.local/bin
if ! test -d "${dir}"; then
  mkdir -p "${dir}"
fi
export PYTHONPATH=${dir}:${PYTHONPATH}
prependPath ${dir}

# Add site-wide Python packages
if test "${PYTHON_VERSION}" == "2.6"; then
  PYTHON_SITE=/opt/local/lib/python2.6/site-packages
else
  PYTHON_SITE=$(dirname $(dirname $PYTHON_HOME))/lib/python${PYTHON_VERSION}
fi
export PYTHONPATH=${PYTHONPATH}:${PYTHON_SITE}
