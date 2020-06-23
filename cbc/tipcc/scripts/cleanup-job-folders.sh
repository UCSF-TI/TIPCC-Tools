#! /usr/bin/env bash

CLEANUP_DRYRUN=${CLEANUP_DRYRUN:-true}

## Find all folders that could possibly be above job folders
dirs=$(find /scratch -type d -name "*.cclc01.som.ucsf.edu")
dirs=$(echo "$dirs" | grep -E "/scratch/(|[^/]+/|[^/]+/job/)[0-9]+(|[[][0-9]+[]])[.]cclc01[.]som[.]ucsf[.]edu$")

## For each of them, identify the job id and query 'qstat' if that job exists
for dir in $dirs; do
  jobid=${dir##*/}
  if [[ -z "$jobid" ]]; then
      continue
  fi
  printf "%s: " "$dir"
  if qstat "$jobid" 2> /dev/null > /dev/null; then
      echo "existing job ... skipping"
      continue
  fi      

  printf "non-existing job  ... "
  if $CLEANUP_DRYRUN; then
      echo "dryrun"
  elif [[ -d "$dir" ]]; then
      rm -r "$dir"
      echo "deleted"
  else
      echo "non-existing"
  fi
done

