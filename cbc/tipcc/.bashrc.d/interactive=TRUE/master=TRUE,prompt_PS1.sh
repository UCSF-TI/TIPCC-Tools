## Description: Highlight, in command-line prompt, that user is on master
##
## Note: In addition to PS1 there's also PS2 (for continuation)
##
## See also: A neat PS1 generator (http://bashrcgenerator.com/)
if [[ "$PS1" && "$HOSTNAME" == "cclc01.som.ucsf.edu" ]]; then
    case $TERM in
        xterm*)
## OR?	    export PS1='\e[1;31m\]** ON MASTER **\[\e[m\] [\u@\h \W]\$ '
            export PS1='[\u@\[\e[1;31m\]\h\[\e[m\] \W]\$ '
            ;;
        screen)
## OR?	    export PS1='\e[1;31m\]** ON MASTER **\[\e[m\] [\u@\h \W]\$ '
            export PS1='[\u@\[\e[1;31m\]\h\[\e[m\] \W]\$ '
            ;;
        *)
            export PS1='** ON MASTER ** [\u@\h \W]\$ '
            ;;
    esac
fi
