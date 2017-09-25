# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# /tmp/ folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export TMP_ROOT="/tmp"
export TMP_USER="$TMP_ROOT/$USER"
if [[ ! -d "$TMP_USER" ]]; then
  mkdir -p "$TMP_USER"
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# /scratch/ folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create /scratch/$USER/ (only possible on compute nodes)
if [[ -d "/scratch" ]]; then
  export SCRATCH_ROOT="/scratch"
  export SCRATCH_USER="$SCRATCH_ROOT/$USER"
  if [[ ! -d "$SCRATCH_USER" ]]; then
    mkdir -p "$SCRATCH_USER"
  fi
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Default folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export TMPDIR="$TMP_USER"
if [[ -d "/scratch" ]]; then
  export SCRATCHDIR="$SCRATCH_USER"
fi
