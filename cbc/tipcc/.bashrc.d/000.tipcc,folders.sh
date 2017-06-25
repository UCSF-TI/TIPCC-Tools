# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# /tmp/ folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export TMP_USER="/tmp/$USER"
if [[ ! -d "$TMP_USER" ]]; then
  mkdir -p "$TMP_USER"
fi


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# /var/tmp/ folders
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
export VARTMP_USER="/var/tmp/$USER"
if [[ ! -d "$VARTMP_USER" ]]; then
  mkdir -p "$VARTMP_USER"
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
export VARTMPDIR="$VARTMP_USER"
if [[ -d "/scratch" ]]; then
  export SCRATCHDIR="$SCRATCH_USER"
fi
