#!/usr/bin/env bash
### UCSF TIPCC Startup Scripts
###
### This script sources all executable scripts under directory
### /etc/.bashrc.d/ or in subdirectories thereof.
###
### USAGE:
### To use this script add:
### 
### [[ -x /etc/bashrc.tipcc ]] && . /etc/bashrc.tipcc
### 
### to /etc/bashrc.
###
### For more details, see bash_startup --help 
###  (https://github.com/HenrikBengtsson/bash-startup).
###
### Copyright: Henrik Bengtsson (2017-2018)
### License: GPL (>= 2.1)

## ---------------------------------------------------------------------------
##  Local functions
## ---------------------------------------------------------------------------
function debug_echo() {
    tput setaf 8 2> /dev/null ## gray
    >&2 echo "$*"
    tput sgr0 2> /dev/null    ## reset
}


[[ -n "${STARTUP_DEBUG}" ]] && debug_echo "Using ${BASH_SOURCE[0]}"

## Load bash-startup which provides startup_source_d() et al.
## NOTE: Defensive approach in case /etc/... is not prestaged. /HB 2018-05-31
if [[ -x /etc/bash-startup ]]; then
    ## Predefined startup variables
    master=false; [[ "$HOSTNAME" == "cclc01.som.ucsf.edu" ]] && master=true
    job=false; [[ -n ${PBS_QUEUE+x} ]] && job=true
    lmod=false; [[ $STARTUP_DONE == *"lmod"* ]] && lmod=true
    . /etc/bash-startup ---
elif [[ -x /home/shared/cbc/tipcc/bash-startup/bash-startup ]]; then
    ## Predefined startup variables
    master=false; [[ "$HOSTNAME" == "cclc01.som.ucsf.edu" ]] && master=true
    job=false; [[ -n ${PBS_QUEUE+x} ]] && job=true
    lmod=false; [[ $STARTUP_DONE == *"lmod"* ]] && lmod=true
    . /home/shared/cbc/tipcc/bash-startup/bash-startup ---
    [[ -n "${STARTUP_DEBUG}" ]] && _startup_warn "Using /home/shared/cbc/tipcc/bash-startup/bash-startup"
fi
if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "Utilizing bash-startup $(bash_startup --version)"; fi
    

## ---------------------------------------------------------------------------
## Local functions
## ---------------------------------------------------------------------------

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
if [[ "$HOSTNAME" == c4-* ]]; then
    export CLUSTER=c4
fi

## ---------------------------------------------------------------------------
## Source the different .bashrc.d/ files, unless already done previously
## ---------------------------------------------------------------------------
if [[ $STARTUP_DISABLE != "true" && $STARTUP_DONE != *"tipcc-startup"* ]]; then
    if [[ -n "${STARTUP_DEBUG}" ]]; then debug_echo "STARTUP_FLAVOR: '$STARTUP_FLAVOR'"; fi
    ## NOTE: Defensive approach in case /etc/... is not prestaged. /HB 2018-05-31
    if [[ "$STARTUP_FLAVOR" != "2018-05-31" && -d /etc/bashrc.d ]]; then
        STARTUP_DONE=tipcc-startup
        startup_source_d /etc/bashrc.d ---
    elif [[ -d /home/shared/cbc/tipcc/.bashrc.d ]]; then
        [[ ! -d /etc/bashrc.d ]] && [[ -n "${STARTUP_DEBUG}" ]] && _startup_warn "/etc/bashrc.d is not a directory on $HOSTNAME"
        STARTUP_DONE=tipcc-startup
        startup_source_d /home/shared/cbc/tipcc/.bashrc.d ---
    fi
fi
