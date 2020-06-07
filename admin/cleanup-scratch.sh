#! /usr/bin/env bash

message() { echo "$@" 1>&2; }

debug() {
    if ! $debug; then return; fi
    {
        tput setaf 8 ## gray
        echo "DEBUG: $*"
        tput sgr0    ## reset
    } 1>&2
}

error() {
    {
        tput setaf 1 ## red
        echo "ERROR: $*"
        tput sgr0    ## reset
    } 1>&2
    exit 1
}


# Configuration
days=60
debug=true
dryrun=false

[[ days -lt 60 ]] && { error "Option 'days' is less than 60 days, which is too short: $days"; }

echo "Hostname       : $HOSTNAME"
echo "Timestamp      : $(date --rfc-3339=seconds)"
echo "Time limit     : $days days"

## Identify files to be deleted
files=$(mktemp)
printf "Scanning for old files ..."
t0=$(date +%s)
find /scratch/ -type f -atime "+$days" -ctime "+$days" -mtime "+$days" -exec ls -l -a -u -t {} \; > "$files"
t1=$(date +%s)
printf " done [%d seconds]\\n" "$((t1 - t0))"
nfiles=$(wc -l "$files" | sed 's/[[:space:]].*//g')
total_size=$(awk '{ total+=$5 } END { print total }' "$files")

echo "Number of files: $nfiles"
echo "Total file size: $(( total_size/1000000000 )) GB"
if [[ $nfiles -gt 0 ]]; then
    file=$(head -1 "$files" | sed 's/.* \//\//g')
    access=$(stat --format="%x" "$file")
    echo "Oldest access  : $access"
    file=$(tail -1 "$files" | sed 's/.* \//\//g')
    access=$(stat --format="%x" "$file")
    echo "Newest access  : $access"
    if [[ $nfiles -gt 6 ]]; then
        echo "Files to be removed (sorted by access time):"
        head -3 "$files"
        echo "..."
        tail -3 "$files"
    else
        echo "Files to be removed (sorted by access time):"
        cat "$files"
    fi
fi
rm "$files"


echo "Disk usage before cleanup:"
df -P /scratch

if ! $dryrun; then
    printf "Removing old files ..."
    t0=$(date +%s)
    find /scratch/ -type f -atime "+$days" -ctime "+$days" -mtime "+$days" -exec rm {} \;
    t1=$(date +%s)
    printf " done [%d seconds]\\n" "$((t1 - t0))"
    echo "Disk usage after cleanup:"
    df -P /scratch
fi
