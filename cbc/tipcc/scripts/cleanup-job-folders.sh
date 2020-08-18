#! /usr/bin/env bash

CLEANUP_DRYRUN=${CLEANUP_DRYRUN:-false}

dir=${1:-/scratch}
[[ -n "$dir" ]] || { echo "ERROR: Argument 'dir' is not specified"; exit 1; }
[[ -d "${dir}" ]] || { echo "ERROR: No such folder: ${dir}"; exit 1; }

jobs_path=/var/spool/torque/mom_priv/jobs
[[ -d "${jobs_path}" ]] || { echo "ERROR: Job folder not found: ${jobs_path}"; exit 1; }

## Find all folders that could possibly be above job folders (>= 1 day old)
# paths=$(find "$dir" -type d -name "*.cclc01.som.ucsf.edu" -ctime 1 -mtime 1 -atime 1)
## Find all folders that could possibly be above job folders (>= 24 hours old)
paths=$(find "$dir" -type d -name "*.cclc01.som.ucsf.edu" -cmin +1440 -mmin +1440 -amin +1440)
paths=$(find "$dir" -type d -name "*.cclc01.som.ucsf.edu" -cmin +720 -mmin +720 -amin +720)
paths=$(find "$dir" -type d -name "*.cclc01.som.ucsf.edu" -cmin +240 -mmin +240 -amin +240)
paths=$(find "$dir" -type d -name "*.cclc01.som.ucsf.edu" -cmin +60 -mmin +60 -amin +60)
paths=$(echo "$paths" | grep -E "/scratch/(|[^/]+/|[^/]+/job/)[0-9]+(|[[][0-9]+[]])[.]cclc01[.]som[.]ucsf[.]edu$")
echo "Job folders older than 1 hour:"
echo "$paths"

## For each of them, identify the job and see if it exists
for path in $paths; do
  jobid=${path##*/}
  if [[ -z "${jobid}" ]]; then
      continue
  fi
  printf "%s: " "${path}"

  ## (a) Query 'qstat' to see if the job exists
  if qstat "${jobid}" 2> /dev/null > /dev/null; then
      echo "existing job in qstat ... skipping"
      continue
  fi      

  ## (b) Look into /var/spool/torque/mom_priv/jobs/
  ##     Because, above 'qstat' may fail for several reasons,
  ##     also when the job actually exists
  [[ -d "${jobs_path}" ]] || { echo "ERROR: Job folder not found: ${jobs_path}"; exit 1; }
  if [[ -d "${jobs_path}" ]]; then
      ## <jobid>[<task>].cc* => <jobid>-<task>.cc*
      jobid2=${jobid/]/}
      jobid2=${jobid2/[/-}
      jobs=$(find "${jobs_path}" -type f -name "${jobid2}*")
      if [[ -n "${jobs}" ]]; then	       
          echo "existing job in ${jobs_path} ... skipping"
          continue
      fi
  fi

  ## (c) Make sure there is no process refering to the job id in env vars
  if grep -q -F "${jobid}" /proc/[0-9]*/environ; then
      echo "existing job in /proc/<pids>/environ ... skipping"
      continue
  fi		   

  ## Now we're pretty confident that the job does not exist
  printf "non-existing job ... "
  if $CLEANUP_DRYRUN; then
      echo "dryrun"
  elif [[ -d "${path}" ]]; then
      rm -r "${path}"
      echo "deleted"
  else
      echo "non-existing"
  fi
done

