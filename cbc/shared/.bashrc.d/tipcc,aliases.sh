# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Create aliases 'n0, 'n1', etc. to ssh into corresponding node 
# preserving the current working directory.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for kk in {0..27}; do
  eval "alias n${kk}='pwd=\$(pwd); ssh -Y -t n${kk} \"cd \$pwd; $SHELL\"'"
done


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Cluster tools
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
alias ganglia='lynx -accept_all_cookies http://localhost/ganglia/'
#alias gmem='free -g | echo "      `head -1`"; gsh free -g | egrep -e "Mem"'
alias gswap='free -g | echo "      `head -1`"; gsh free -g | egrep -e "Swap"'
alias gmem='gsh vmstatmem'
alias topme='top -U ${USER}'
alias htopme='htop -u ${USER}'
alias psme='ps -ef | grep ${USER}'
