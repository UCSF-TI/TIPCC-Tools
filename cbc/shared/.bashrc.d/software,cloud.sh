# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Cloud tools
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Dropbox
## prependPath ${SHARED_SOFTWARE}/.dropbox-dist
## prependPath ${SHARED_SOFTWARE}/dropbox-cli
## alias dropbox="python ${SHARED_SOFTWARE}/dropbox-cli/dropbox.py"

# s3cmd (Amazon AWS S3)
if [[ $(using_lmod) -eq 0 ]]; then
    module_load s3cmd ""
#prependPath ${SHARED_SOFTWARE}/s3cmd-latest
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Miscellaneous
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Mirror website
alias wmirror="wget --no-host-directories --recursive --no-parent --reject='index.html*'"
