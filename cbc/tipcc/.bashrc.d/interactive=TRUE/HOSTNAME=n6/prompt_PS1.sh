## Description: Highlight, in command-line prompt, that user is on interactive node
##
## Note: In addition to PS1 there's also PS2 (for continuation)
## as well as PROMPT_COMMAND.
##
## See also: A neat PS1 generator (http://bashrcgenerator.com/)
if [[ "$PS1" && $HOSTNAME == n6 ]]; then
    case $TERM in
        xterm*)
## OR?	    export PS1='\[\e[1;31m\]** ON INTERACTIVE **\[\e[m\] [\u@\h \W]\$ '
            export PS1='[\u@\[\e[1;32m\]\h\[\e[m\] \W]\$ '
            ;;
        screen)
## OR?	    export PS1='\[\e[1;31m\]** ON INTERACTIVE **\[\e[m\] [\u@\h \W]\$ '
            export PS1='[\u@\[\e[1;32m\]\h\[\e[m\] \W]\$ '
            ;;
        *)
            export PS1='** ON INTERACTIVE NODE ** [\u@\h \W]\$ '
            ;;
    esac
fi
