# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# R
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if [[ $(using_lmod) -eq 0 ]]; then
  if [[ $CBC_DEVEL != "false" ]]; then
    if test "${PKG_LIBS0}" = ""; then
      export PKG_LIBS0="${PKG_LIBS}"
    else
      export PKG_LIBS="${PKG_LIBS0}"
    fi
    
    # Fixes "/usr/bin/ld: cannot find -lgfortran" error when
    # building package that needs libgfortran.
    # FIXME: Should this be configured already when building R, i.e.
    #        in /home/shared/cbc/bin/installR? /HB 2015-01-10
    if test -d "${GCC_HOME}"; then
      export PKG_LIBS="${PKG_LIBS} -L${GCC_HOME}"
    fi
    
    ## 'nc-config' needs to be on the PATH in order to install R package ncdf4
    appendPath /opt/NetCDF/NetCDF-4.3.0/bin
  fi
fi

## Setup R_LIBS locally for user and machine type
# Get the OS type in lower case
#ostype=`uname -s | tr '[A-Z]' '[a-z]'`
#export R_LIBS=${HOME}/R/${ostype}/library/
#if ! test -d "${R_LIBS}"; then
#  mkdir -p ${R_LIBS}
#fi


if [[ $(using_lmod) -eq 0 ]]; then
  alias R-2.15.3=${SHARED_SOFTWARE}/R-2.15.3/bin/R
  alias R-3.0.0=${SHARED_SOFTWARE}/R-3.0.0/bin/R
  alias R-3.0.1=${SHARED_SOFTWARE}/R-3.0.1/bin/R
  alias R-3.0.2=${SHARED_SOFTWARE}/R-3.0.2/bin/R
  alias R-3.0.3=${SHARED_SOFTWARE}/R-3.0.3/bin/R
  alias R-3.1.0=${SHARED_SOFTWARE}/R-3.1.0/bin/R
  alias R-3.1.1=${SHARED_SOFTWARE}/R-3.1.1/bin/R
  alias R-3.1.2=${SHARED_SOFTWARE}/R-3.1.2/bin/R
  alias R-3.1.3=${SHARED_SOFTWARE}/R-3.1.3/bin/R
  alias R-3.2.0=${SHARED_SOFTWARE}/R-3.2.0/bin/R
  alias R-3.2.1=${SHARED_SOFTWARE}/R-3.2.1/bin/R
  alias R-3.2.3=${SHARED_SOFTWARE}/R-3.2.3/bin/R
  alias R-3.3.0=${SHARED_SOFTWARE}/R-3.3.0/bin/R
  alias R-3.3.1=${SHARED_SOFTWARE}/R-3.3.1/bin/R
  alias R-3.3.2=${SHARED_SOFTWARE}/R-3.3.2/bin/R
  alias R-3.3.3=${SHARED_SOFTWARE}/R-3.3.3/bin/R
  alias R-latest=${SHARED_SOFTWARE}/R-latest/bin/R
  alias R-patched=${SHARED_SOFTWARE}/R-patched/bin/R
  alias R-devel=${SHARED_SOFTWARE}/R-devel/bin/R
  alias useR=". ${SHARED_ROOT}/bin/useR"
else
  ## TODO: Replace these aliases with warnings
  ## to use 'module load r/x.y.z instead.
  alias R-2.15.3=${SHARED_SOFTWARE}/R-2.15.3/bin/R
  alias R-3.0.0=${SHARED_SOFTWARE}/R-3.0.0/bin/R
  alias R-3.0.1=${SHARED_SOFTWARE}/R-3.0.1/bin/R
  alias R-3.0.2=${SHARED_SOFTWARE}/R-3.0.2/bin/R
  alias R-3.0.3=${SHARED_SOFTWARE}/R-3.0.3/bin/R
  alias R-3.1.0=${SHARED_SOFTWARE}/R-3.1.0/bin/R
  alias R-3.1.1=${SHARED_SOFTWARE}/R-3.1.1/bin/R
  alias R-3.1.2=${SHARED_SOFTWARE}/R-3.1.2/bin/R
  alias R-3.1.3=${SHARED_SOFTWARE}/R-3.1.3/bin/R
  alias R-3.2.0=${SHARED_SOFTWARE}/R-3.2.0/bin/R
  alias R-3.2.1=${SHARED_SOFTWARE}/R-3.2.1/bin/R
  alias R-3.2.3=${SHARED_SOFTWARE}/R-3.2.3/bin/R
  alias R-3.3.0=${SHARED_SOFTWARE}/R-3.3.0/bin/R
  alias R-3.3.1=${SHARED_SOFTWARE}/R-3.3.1/bin/R
  alias R-3.3.2=${SHARED_SOFTWARE}/R-3.3.2/bin/R
  alias R-3.3.3=${SHARED_SOFTWARE}/R-3.3.3/bin/R
  alias R-latest=${SHARED_SOFTWARE}/R-latest/bin/R
  alias R-patched=${SHARED_SOFTWARE}/R-patched/bin/R
  alias R-devel=${SHARED_SOFTWARE}/R-devel/bin/R
  ## TODO: Update useR to give a warning
  ## to use 'module load r/x.y.z instead.
  alias useR=". ${SHARED_ROOT}/bin/useR"
fi
