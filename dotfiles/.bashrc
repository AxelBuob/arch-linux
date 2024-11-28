https://bbs.archlinux.org/viewtopic.php?id=108613

PS1='\[\e[0;32m\]\w\[\e[0m\] '
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P8333333" #darkgrey
    echo -en "\e]P1432424" #darkred
    echo -en "\e]P9482727" #red
    echo -en "\e]P21C341C" #darkgreen
    echo -en "\e]PA203C20" #green
    echo -en "\e]P33C4013" #darkyellow
    echo -en "\e]PB444815" #yellow
    echo -en "\e]P4212F3E" #darkblue
    echo -en "\e]PC253546" #blue
    echo -en "\e]P5322A39" #darkmagen4ta
    echo -en "\e]PD3A3042" #magenta
    echo -en "\e]P6111B1B" #darkcyan
    echo -en "\e]PE1D302E" #cyan
    echo -en "\e]P7555555" #lightgrey
    echo -en "\e]PF777777" #white
    clear #for background artifacting
fi
export TERM="rxvt-256color"
export EDITOR="vim"
export VISUAL="vim"
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export BROWSER="w3m '%s' &"
shopt -s extglob
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
complete -cf sudo
complete -cf man
complete -cf k
