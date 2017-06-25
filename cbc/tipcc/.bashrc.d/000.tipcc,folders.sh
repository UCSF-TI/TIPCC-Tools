# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# /tmp/ folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export TMP_USER="/tmp/$USER"
if [[ ! -d "$TMP_USER" ]]; then
  mkdir -p "$TMP_USER"
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# /scratch/ folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create /scratch/$USER/ (only possible on compute nodes)
if [[ -d "/scratch" ]]; then
  export SCRATCH_USER="/scratch/$USER"
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
