# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Personalized temporary and scratch directory
# (e.g. cleaner /tmp/ directory on cluster)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export TMPDIR=/tmp/$USER
if ! test -d "$TMPDIR"; then
  mkdir -p "$TMPDIR"
fi

export VARTMPDIR=/var/tmp/$USER
if ! test -d "$VARTMPDIR"; then
  mkdir -p "$VARTMPDIR"
fi

# Create /scratch/$USER/ (only possible on compute nodes)
if test -d "/scratch"; then
  export SCRATCHDIR=/scratch/$USER
  if ! test -d "$SCRATCHDIR"; then
    mkdir -p "$SCRATCHDIR"
  fi
fi
