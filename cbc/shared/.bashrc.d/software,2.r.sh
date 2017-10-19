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
