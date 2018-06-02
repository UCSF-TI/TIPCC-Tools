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
function startup_source_d() {
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

    ## File name filter: Running in interactive mode or not?
    if [[ -n "$PS1" ]]; then
        ## Interactive, so drop pathnames with interactive=FALSE
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "interactive=FALSE")
    else
        ## Non-interactive, so drop pathnames with interactive=TRUE
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "interactive=TRUE")
    fi

    ## File name filter: Running on master (== head node) or not?
    if [[ "$HOSTNAME" == "cclc01.som.ucsf.edu" ]]; then
        ## On master, so drop pathnames with master=FALSE
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "master=FALSE")
    else
        ## Not on master, so drop pathnames with master=TRUE
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "master=TRUE")
    fi

    ## File name filter: Running as a job or not?
    if [[ -z ${PBS_QUEUE+x} ]]; then
	## Not running as a job, so drop pathnames with job=TRUE
	source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "job=TRUE")
    else
	## Running as a job, so drop pathnames with job=FALSE
	source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "job=FALSE")
    fi
    
    ## File name filter: Filter based on CLUSTER=<name>?
    if [[ -n "${CLUSTER}" ]]; then
        ## Drop all files with CLUSTER=<value> that does not match CLUSTER=${CLUSTER}
        ## This requires negative-lookahead regular expression, which in turn requires
        ## an PCRE-enabled grep, hence the 'grep --perl-regexp' call.
        local neq='!'
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep --perl-regexp -v "CLUSTER=(?${neq}${CLUSTER})")
    fi

    ## File name filter: Filter based on USER=<name>?
    if [[ -n "${USER}" ]]; then
        ## Drop all files with USER=<value> that does not match USER=${USER}
        ## This requires negative-lookahead regular expression, which in turn requires
        ## an PCRE-enabled grep, hence the 'grep --perl-regexp' call.
        local neq='!'
        source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep --perl-regexp -v "USER=(?${neq}${USER})")
    fi

    ## File name filter: Filter based on lmod=FALSE?
    ## (temporary while migrating away from source /home/shared/cbc/bashrc)
    if [[ $STARTUP_DONE == *"lmod"* ]]; then
	if [[ $(using_lmod) -eq 1 ]]; then
	    ## Drop all files with lmod=FALSE
  	    source_d_files=$(printf "%s\n" ${source_d_files[@]} | grep -vF "lmod=FALSE")
	fi
    fi
    
    ## Source remaining files
    local ff=
    for ff in ${source_d_files}; do
        if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "${prefix}$(startup_duration)s:  - ${ff}"; fi
        source "${ff}"
    done

    if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "${prefix}$(startup_duration)s: Sourcing ${source_d_path}/ ... done"; fi
} ## startup_source_d()

## Backward compatibility
function source_d() {
    startup_source_d "$@"
}


[[ -n "${STARTUP_DEBUG}" ]] && debug_echo "Using ${BASH_SOURCE[0]}"

## Load bash-startup which provides startup_source_d() et al.
## NOTE: Defensive approach in case /etc/... is not prestaged. /HB 2018-05-31
if [[ -x /etc/bash-startup ]]; then
    ## Predefined startup variables
    master=false; [[ "$HOSTNAME" == "cclc01.som.ucsf.edu" ]] && master=true
    job=false; [[ -n ${PBS_QUEUE+x} ]] && job=true
    lmod=false; [[ $STARTUP_DONE == *"lmod"* ]] && lmod=true
    . /etc/bash-startup
elif [[ -x /home/shared/cbc/tipcc/bash-startup/bash-startup ]]; then
    ## Predefined startup variables
    master=false; [[ "$HOSTNAME" == "cclc01.som.ucsf.edu" ]] && master=true
    job=false; [[ -n ${PBS_QUEUE+x} ]] && job=true
    lmod=false; [[ $STARTUP_DONE == *"lmod"* ]] && lmod=true
    . /home/shared/cbc/tipcc/bash-startup/bash-startup
    [[ -n "${STARTUP_DEBUG}" ]] && _startup_warn "Using /home/shared/cbc/tipcc/bash-startup/bash-startup"
fi
if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "$(startup_duration)s: Utilizing bash-startup $(bash_startup --version)"; fi
    

### fix_permissions - fix file permission
###
### Usage:
###   fix_permissions <file> <target> <action> [<reason>] [<warn>]
###
### Arguments:
###   file    the file/directory of interest
###   target  the target permission as a regular expression
###   action  the chmod action string
###   reason  a message string giving the reason for the change
###   warn    if 'true' (default) a warning message is produced if
###           the permissions were changed, otherwise not
###
### Example:
### fix_permissions $HOME d....-..-. go-w "SSH key-pair login does not work if others have write permissions to your home directory"
###
### Details:
### Then function returns silently if the file permissions are met,
### if the 'file' does not exist, or argument 'target' or 'action' is
### not specified.
### If the file permissions are not sufficent also after trying to
### apply the 'action', then an error message is produced.
###
### Copyright: Henrik Bengtsson (2016-2017)
### License: GPL (>= 2.1) [https://www.gnu.org/licenses/gpl.html]
function fix_permissions() {
    local file="$1"
    local target="$2"
    local action="$3"
    local reason="$4"
    local warn="${5:-true}"

    if [[ $DEBUG == true ]]; then
	echo "file='$file'"
	echo "target='$target'"
	echo "action='$action'"
	echo "warn='$warn'"
    fi

    ## Nothing to do?
    if [[ ! -e $file ]]; then
	return;
    fi
    if [[ -z $target ]]; then
	return;
    fi
    if [[ -z $action ]]; then
	return;
    fi

    ## Permissions already correct?
    local perms=$(stat --format=%A $file)
    if [[ $DEBUG == true ]]; then
	echo "perms='$perms'"
    fi
    if [[ "$perms" =~ $target ]]; then return; fi

    ## Fix permissions
    chmod $action $file

    ## Assert fix
    local perms_0=$perms
    local perms=$(stat --format=%A $file)
    if [[ $DEBUG == true ]]; then
	echo "perms='$perms'"
    fi

    if [[ -n $reason ]]; then
	reason="Note: $reason";
    fi

    if [[ "$perms" =~ $target ]]; then
	if [[ $warn == true ]]; then
	    tput setaf 3 2> /dev/null ## yellow
	    >&2 echo "WARNING: '$file' had access permissions ($perms_0) that were insufficient (target regexp=$target). Permissions were modified (chmod $action '$file') resulting in new permissions ($perms). $reason"
	    tput sgr0 2> /dev/null    ## reset
	fi
	return
    fi

    ## ERROR: Failed to set sufficient permissions
    tput setaf 1 2> /dev/null ## red
    >&2 echo "ALERT: '$file' had access permissions ($perms_0) that were insufficient (target regexp=$target). Tried to reset permissions (chmod $action '$file'), but failed; permissions are still insuffient ($perms). $reason"
    tput sgr0 2> /dev/null    ## reset
} ## fix_permissions()

function fix_permissions_to_user_only() {
  ## Nothing to do?
  if [[ ! -e $1 ]]; then return; fi

  ## Permissions already correct?
  local perms=$(stat --format=%A $1)
  local perms_go=$(echo $perms | cut -c 5-10)
  if [[ "$perms_go" == "------" ]]; then return; fi
  
  ## Fix permissions
  chmod go-rwx $1

  ## Assert fix
  local permsT=$(stat --format=%A $1)
  perms_go=$(echo $permsT | cut -c 5-10)
  if [[ "$perms_go" != "------" ]]; then
    tput setaf 1 2> /dev/null ## red
    >&2 echo "SECURITY ALERT: '$1' may be accessible to others (ugo=$perms). Tried to reset permissions (chmod go-rwx '$1'), but failed. The file/directory may still be accessible to others; ugo=$permsT"
    tput sgr0 2> /dev/null    ## reset
    return
  fi

  tput setaf 3 2> /dev/null ## yellow
  >&2 echo "SECURITY WARNING: '$1' may have been accessible to others (ugo=$perms). Permissions were reset (chmod go-rwx '$1') such only you can access it. New permissions: ugo=$perms}"
  tput sgr0 2> /dev/null    ## reset
}

export CLUSTER=tipcc

## ---------------------------------------------------------------------------
## Source the different .bashrc.d/ files, unless already done previously
## ---------------------------------------------------------------------------
if [[ $STARTUP_DONE != *"tipcc-startup"* ]]; then
    if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "$(startup_duration)s: STARTUP_FLAVOR: '$STARTUP_FLAVOR'"; fi
    ## NOTE: Defensive approach in case /etc/... is not prestaged. /HB 2018-05-31
    if [[ "$STARTUP_FLAVOR" == "2018-05-31" && -d /etc/bashrc.d ]]; then
        STARTUP_DONE=tipcc-startup
        startup_source_d /etc/bashrc.d
    elif [[ -d /home/shared/cbc/tipcc/.bashrc.d ]]; then
        [[ ! -d /etc/bashrc.d ]] && [[ -n "${STARTUP_DEBUG}" ]] && _startup_warn "/etc/bashrc.d is not a directory on $HOSTNAME"
        STARTUP_DONE=tipcc-startup
        startup_source_d /home/shared/cbc/tipcc/.bashrc.d
    fi
fi
