# .bashrc

function source_if_exists()
{
  if [ -f $1 ]; then
    . $1
  else
    echo "Warning: $1 does not exist, so cannot be sourced (in $BASH_SOURCE)"
  fi
}
alias a='alias' # lol

source_if_exists /etc/bashrc # Global definitions
source_if_exists ~/.bashrc_typos # E.g. Alias "greo" to "grep"
source_if_exists ~/.bashrc_traversals # For all the alias ..='cd ..' stuff

# Environment setup
source_if_exists /usr/local/share/chruby/chruby.sh 
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export EDITOR=vim
# Customise/prettify the command prompt
export PROMPT_COMMAND='result=$?; if [ $result = 0 ]; then symbol="☺"; colour=2; elif [ $result = 1 -o $result = 130 ]; then symbol="○"; colour=3; else symbol="☻"; colour=1; fi;\
PS1="\[$(tput setaf `echo \$colour`)\]\$symbol\
\[$(tput setaf 5)\][\[$(tput setaf `if [[ $UID = 0 ]]; then echo 1; else echo 4; fi`)\]\u@\h\
\[$(tput setaf 5)\] \W]> \[$(tput sgr0)\]"'
set -o vi
set show-all-if-ambiguous on
set completion-ignore-case on

# Handy shortcuts/functions
a c='clear'
a g='grep -rn'
a gi='grep -rni'
a diff='colordiff' # Note: Must have colordiff installed!!
a h='history'
a j='jobs -l'
a wcl='wc -l'
a svim='sudo vim'
a hg='history | grep'
a hgi='history | grep -i'
a ll='ls -lh'
a l='ll'
a tf='tail -f'
a lsd='ls -l | grep "^d"'
a syi='sudo yum install'
a sys='sudo yum search'
a fastping='ping -c 100 -s.2'
a ports='netstat -tulanp'
a connections='sudo lsof -nPi +c 15'
a 'ps?'='ps aux | grep'
a 'psi?'='ps aux | grep -i'
a rpmqa='rpm -qa | grep'
a rpmqai='rpm -qa | grep -i'
a go='function e { if [ -f $1 ]; then vim $1; elif [ -d $1 ]; then cd $1; else echo "ERROR: File/directory does not exist!"; fi }; e $1'
a mkcd='function e { mkdir -p $1 && cd $1; }; e $1'
function calc() { echo $1 | bc -l; }
a whatarethecolours='for i in {0..8}; do tput setaf $i; echo -n $i; done; tput setaf 0; echo'
function xargsvim() { shift 1; xargs bash -c '</dev/tty vim "$@"'; }
function extract()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.tar.Z) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.jar) unzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1" ;;
      *.tar.bz2) tar xjf "$1" ;;
      *) echo "'$1' cannot be extracted. (Unrecognised file extension for compressed file)" ;;
    esac
  else
    echo "Error: '$1' is not a file."
  fi
}

# Default additional options for commands
# Warning: These all "overload" some default behaviour!
a cmake=cmake28
a grep='grep --color=auto'
a fgrep='fgrep --color=auto'
a egrep='egrep --color=auto'
a mkdir='mkdir -pv'
a cp='cp -i' # Prompt confirmation in case of file overwrite
a mv='mv -i'
a which='type -all'
a free='free -m' # Show sizes is Mb
a du='du -h --max-depth=1'
a top='sudo atop' # Note: Must have atop installed!!
function p4()
{ 
  case $* in
    filelog* ) shift 1; command p4 filelog -lt -m10 "$@" ;;
    refresh ) command p4 edit "./..." ; command p4 revert -a "./..."; command echo "****************************"; command p4 opened ;;
    * ) command p4 "$@" ;;
  esac
}
function rpm()
{
  case $* in
    -i* ) shift 1; command sudo rpm -ivh "$@" ;;
    -e* ) shift 1; command sudo rpm -ev "$@" ;;
    * ) command sudo rpm "$@" ;;
  esac
}

unset source_if_exists # Not really needed outside of bashrc!
