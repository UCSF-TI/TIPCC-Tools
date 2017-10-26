# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Personal public_html
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Only on head node
if test $ISCOMPUTENODE == 0; then
# Create users ~/public_html, iff missing
## if ! test -d "${HOME}/public_html"; then
##   mkdir "${HOME}/public_html"
##   t=${HOME}/public_html/README.txt
##   echo "The content in your ~/public_html/ directory can be accessed" > ${t}
##   echo "via the web using address http://cclc01.som.ucsf.edu/~${USER}/." >> ${t}
##   echo "You can use this to setup your own internal webpage and/or" >> ${t}
##   echo "result files (e.g. HTML, PDF) from jobs easily accessible." >> ${t}
##   echo "" >> ${t}
##   echo "SECURITY: To access your web content from outside the UCSF" >> ${t}
##   echo "login via the UCSF VPN, e.g. http://cbc.ucsf.edu/vpn/" >> ${t}
##   chmod go-rwx ${t}
## 
##   t=${HOME}/public_html/index.html
##   echo "<html>" > ${t}
##   echo "<head>" >> ${t}
##   echo " <title>${USER}</title>" >> ${t}
##   echo "</head>" >> ${t}
##   echo "<body>" >> ${t}
##   echo "<h1>${USER}</h1>" >> ${t}
##   echo "Hello world!" >> ${t}
##   echo "</body>" >> ${t}
##   echo "</html>" >> ${t}
## fi

  # Check file permissions
  if test -d "${HOME}/public_html"; then
    $SHARED_ROOT/bin/check-public_html
  fi
fi
