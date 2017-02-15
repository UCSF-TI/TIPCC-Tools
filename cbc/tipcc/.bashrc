#!/usr/bin/env bash
### UCSF TIPCC Startup Scripts
###
### This script sources all executable scripts under directory
### /home/shared/cbc/tipcc/.bashrc.d/ or in subdirectories thereof.
###
### USAGE:
### To use this script add:
### 
### if [[ -x /home/shared/cbc/tipcc/.bashrc ]]; then
###     source /home/shared/cbc/tipcc/.bashrc
### fi
### 
### to, say, /etc/bashrc.
###
### FILE AND DIRECTORY NAME FILTERS:
### If a directory or file name contains a <key>=<value> criterium, it
### will be included / excluded conditionally on these criteria:
###
###  - master=TRUE       sourced only if running on master (= head node)
###  - interactive=TRUE  sourced only if running in interactive mode
###  - CLUSTER=tipcc     sourced only if running on TIPCC cluster
### 
### DEBUGGING:
### To debug what files are sourced and how long each of them takes, set
### STARTUP_DEBUG=true before calling this script.  This can also be done
### by the individual users.  To perform a dry-run, set STARTUP_DRYRUN=true.
###
### Version: 0.1.0-9000
### Copyright: Henrik Bengtsson (2017)
### License: GPL (>= 2.1)

## ---------------------------------------------------------------------------
##  Local functions
## ---------------------------------------------------------------------------
## Usage: msg_echo <msg>
function msg_echo() {
    >&2 echo "$*"
}

## Usage: debug_echo <msg>
function debug_echo() {
    tput setaf 8 2> /dev/null ## gray
    msg_echo "$*"
    tput sgr0 2> /dev/null    ## reset
}

## Keeps track of processing times
STARTUP_START_TIME=$(echo $(($(date +%s%N)/1000000)))
function startup_duration() {
    local d=$(($(echo $(($(date +%s%N)/1000000))) - $STARTUP_START_TIME))
    d=$(echo 000$d | sed -E 's/([0-9]{3})$/.\1/' | sed -E 's/^0*([0-9])/\1/')
    echo $d
}

## Usage: source_d <path>
function source_d() {
    local source_d_path=$1

    if [[ $# -eq 0 ]]; then
        msg_echo "source_d: path not specified"
        return 1;
    elif [[ ! -d "${source_d_path}" ]]; then
        msg_echo "source_d: no such path: ${source_d_path}"
        return 1;
    fi

    local prefix=
    if [[ -n "${STARTUP_DRYRUN}" ]]; then prefix="[dry-run] "; fi
    
    if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "${prefix}$(startup_duration)s: Sourcing ${source_d_path}/ ..." ; fi

    local source_d_files=$(find -L "${source_d_path}" -executable -type f ! -name '*~' 2> /dev/null | LC_ALL=C sort)

    ## File name filter: Not running in interactive mode?
    if [[ -z "$PS1" ]]; then
        ## Drop pathnames with interactive=TRUE
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "interactive=TRUE")
    fi

    ## File name filter: Not running on master (== head node)?
    if [[ "$HOSTNAME" != "cclc01.som.ucsf.edu" ]]; then
        ## Drop pathnames with master=TRUE
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "master=TRUE")
    fi

    ## File name filter: Filter based on CLUSTER=<name>?
    if [[ -n "${CLUSTER}" ]]; then
        ## Drop all files with CLUSTER=<value> that does not match CLUSTER=${CLUSTER}
        ## This requires negative-lookahead regular expression, which in turn requires
        ## an PCRE-enabled grep, hence the 'grep --perl-regexp' call.
        local neq='!'
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep --perl-regexp -v "CLUSTER=(?${neq}${CLUSTER})")
    fi
    
    ## Source remaining files
    local ff=
    for ff in ${source_d_files}; do
        if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "${prefix}$(startup_duration)s:  - ${ff}"; fi
        source "${ff}"
    done

    if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "${prefix}$(startup_duration)s: Sourcing ${source_d_path}/ ... done"; fi
} ## source_d()


export CLUSTER=tipcc

## ---------------------------------------------------------------------------
## Source the different .bashrc.d/ files
## ---------------------------------------------------------------------------
if [[ -d /home/shared/cbc/tipcc/.bashrc.d ]]; then
    source_d /home/shared/cbc/tipcc/.bashrc.d
fi
