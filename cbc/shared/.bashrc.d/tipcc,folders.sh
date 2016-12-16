# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Personalized temporary and scratch directory
# (e.g. cleaner /tmp/ directory on cluster)
# Acknowledged by e.g. R
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export TMPDIR=/tmp/$USER
if ! test -d "$TMPDIR"; then
  mkdir -p "$TMPDIR"
fi

export VARTMPDIR=/var/tmp/$USER
if ! test -d "$VARTMPDIR"; then
  mkdir -p "$VARTMPDIR"
fi

# Create /scratch/$USER/shared/ (only on compute nodes)
if test $ISCOMPUTENODE == 1; then
  export SCRATCHDIR=/scratch/$USER
  if ! test -d "$SCRATCHDIR"; then
    mkdir -p "$SCRATCHDIR"
  fi
fi
