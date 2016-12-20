#!/usr/bin/env bash

###################################################################
# Author: Henrik Bengtsson <hb@biostat.ucsf.edu>
###################################################################

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Useful functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function error() {
    tput setaf 1 2> /dev/null ## red
    >&2 echo "ERROR: $*"
    tput sgr0 2> /dev/null    ## reset
#  exit 1
}

function timestamp() {
  flavor="$1"
  if test -z "${flavor}"; then
    flavor="full"
  fi

  if test "${flavor}" == "date"; then
    echo `date +%Y%m%d`
  elif test "${flavor}" == "time"; then
    echo `date +%H%M%S`
  else
    echo `date +%Y%m%d-%H%M%S`
  fi
} # timestamp()

function today() {
  timestamp date
} # today()

function resetPath() {
  export PATH0=${SYSTEM_PATH}
}


function uniquePath() {
  export PATH=`echo ${PATH} | sed -e 's/:/\n/g' | uniq | paste -s -d ':'`
}

function uniqueManPath() {
  export MANPATH=`echo ${MANPATH} | sed -e 's/:/\n/g' | uniq | paste -s -d ':'`
}

function appendPath() {
  if test -z "$1"; then
    echo "appendPath(): Path is missing."
    return;
  fi
  if ! test -d "$1"; then
    error "No such path: $1"
  fi
  export PATH="${PATH}:$1"
  uniquePath
} # appendPath()

function prependPath() {
  if test -z "$1"; then
    echo "prependPath(): Path is missing."
    return;
  fi
  if ! test -d "$1"; then
    error "No such path: $1"
  fi
  export PATH="$1:${PATH}"
  uniquePath
} # prependPath()

function prependManPath() {
  if test -z "$1"; then
    echo "prependManPath(): Path is missing."
    return;
  fi
  if ! test -d "$1"; then
    error "No such path: $1"
  fi
  export MANPATH="$1:${MANPATH}"
  uniqueManPath
} # prependManPath()


function assertUserOnlyPermissions() {
  path=$1

  ## Nothing to do?
  if ! test -e ${path}; then return; fi

  d=$(dirname ${path})
  f=$(basename ${path})
  
  ## Permissions already correct?
  perms=$(ls -al ${d} | grep -F $f | cut -c 1-10)
  permsGO=$(echo $perms | cut -c 5-10)
  if test "${permsGO}" == "------"; then return; fi
  
  ## Fix permissions
  chmod go-rwx ${path}

  ## Assert fix
  permsT=$(ls -al ${d} | grep -F $f | cut -c 1-10)
  permsGO=$(echo $permsT | cut -c 5-10)
  if test "${permsGO}" != "------"; then
    tput setaf 1 2> /dev/null ## red
    >&2 echo "SECURITY ERROR: Detected that ${path} was accessible by others (ugo=$perms). Tried to reset permissions (chmod go-rwx ${path}), but failed. They are still accessible by others; ugo=${permsT}"
    tput sgr0 2> /dev/null    ## reset
    return
  fi

  tput setaf 3 2> /dev/null ## yellow
  >&2 echo "SECURITY WARNING: Detected that ${path} was accessible by others (ugo=$perms). Permissions were reset (chmod go-rwx ${path}) such only you can access it. New permissions: ugo=${permsT}"
  tput sgr0 2> /dev/null    ## reset
}


# Command prompt
function setPrompt() {
  export PS1="$1"

  # If on the head node...
  if test "$HOSTNAME" == "cclc01.som.ucsf.edu"; then
    # If not already done...
    res=`echo "$PS1" | grep "[*][*][*]"`
    if test -z "$res"; then
      # Prepend command line prompt on head node if not already done.
      export PS1="*****************\n*** HEAD NODE ***\n*****************\n$PS1"
    fi
  fi
} # setPrompt()

function ll_xfer() {
  ssh ${USER}@akt.ucsf.edu "ls -la www/xfer/$1"
}

function llr_xfer() {
  ssh ${USER}@akt.ucsf.edu "ls -laR www/xfer/$1"
}

function rsync_xfer() {
  rsync -av -r $2 ${USER}@akt.ucsf.edu:www/xfer/$1
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Useful system variables
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if test -n "${SHARED_ROOT}"; then
  mkdir -p "${SHARED_ROOT}"
  export SHARED_BIN=${SHARED_ROOT}/bin
  mkdir -p "${SHARED_BIN}"
  export SHARED_LOCAL=${SHARED_ROOT}/local
  mkdir -p "${SHARED_LOCAL}"

  export SHARED_SOFTWARE=${SHARED_ROOT}/software
  mkdir -p "${SHARED_SOFTWARE}"
  export SHARED_SOFTWARE_FROZEN=${SHARED_ROOT}/software_frozen
  mkdir -p "${SHARED_SOFTWARE_FROZEN}"

  # GNU compiler variables
  export SHARED_PREFIX=${SHARED_LOCAL}
#  export SHARED_PKG_CONFIG_PATH=${SHARED_PREFIX}/lib/pkgconfig
  export PKG_CONFIG_PATH=${SHARED_PREFIX}/lib/pkgconfig:${SHARED_PREFIX}/lib64/pkgconfig
fi


###################################################################
# HISTORY:
# 2014-10-13
# o Added SHARED_SOFTWARE_FROZEN.
# 2014-01-07
# o Added setPrompt().
# 2012-04-30
# o Added uniquePath().
# o Extracted includes.bash.
# 2012-04-28
# o Extracted and shared.
###################################################################
