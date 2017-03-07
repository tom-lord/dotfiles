# .bash_aliases / .bashrc, depending on system

function source_if_exists()
{
  if [ -f $1 ]; then
    . $1
  else
    echo "Warning: $1 does not exist, so cannot be sourced (in $BASH_SOURCE)"
  fi
}
alias a='alias' # lol

source_if_exists ~/.bashrc_typos # E.g. Alias "greo" to "grep"
source_if_exists ~/.bashrc_traversals # For all the alias ..='cd ..' stuff

# Environment setup
source_if_exists /home/tom/.rvm/scripts/rvm
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export EDITOR=vim
export P4DIFF=colordiff # Note: Must have colordiff installed!!
# Customise/prettify the command prompt
export PROMPT_COMMAND='result=$?; if [ $result = 0 ]; then symbol="☺"; colour=2; elif [ $result = 1 -o $result = 130 ]; then symbol="○"; colour=3; else symbol="☻"; colour=1; fi;\
PS1="\[$(tput setaf `echo \$colour`)\]\$symbol\
\[$(tput setaf 5)\][\[$(tput setaf `if [[ $UID = 0 ]]; then echo 1; else echo 4; fi`)\]\u@\h\
\[$(tput setaf 5)\] \W \[$(tput setaf 3)\]`echo $(__git_ps1) | tr -d "()" | cut -c 1-6`\[$(tput setaf 5)\]]> \[$(tput sgr0)\]"'
set -o vi
set show-all-if-ambiguous on
set completion-ignore-case on

# Handy shortcuts/functions
a p='pwd'
a c='clear'
# zxcvbn is excluded as this is a JS library in some of my projects,
# which contains a whole dictionary (!!!) so *always* pops up in grep results
a g='grep -rn --exclude=zxcvbn*'
function gi()
{
  if [ "${#1}" -eq 1 ] ; then
    # Stop myself from spamming output by entering commands like "gi s" instead of "git s"
    case "$1" in
      a) git a ;;
      b) git b ;;
      d) git d ;;
      l) git l ;;
      s) git s ;;
      *) echo "Do I really want to grep for 1 letter?! Probably not. Try again." ;;
    esac
  else
    grep -rni --exclude=zxcvbn* "$1" $2
  fi
}
function f()
{
  if [ $# -eq 0 ]; then
    echo "Usage: \`f [dir = .] pattern\` -- Please specify a pattern"
  elif [ $# -eq 1 ]; then
    find . | grep $1
  else
    find $1 | grep $2
  fi
}
a diff='colordiff' # Note: Must have colordiff installed!!
a h='history'
a j='jobs -l'
a wcl='wc -l'
a svim='sudo vim'
a hg='history | grep'
a hgi='history | grep -i'
a ll='ls -lh'
a l='ll'
a l1='ls -1'
a tf='tail -f'
a lsd='ls -l | grep "^d"'
a fastping='ping -c 100 -s.2'
a ports='netstat -tulanp'
a connections='sudo lsof -nPi +c 15'
a 'ps?'='ps aux | grep'
a 'psi?'='ps aux | grep -i'
a rpmqa='rpm -qa | grep'
a rpmqai='rpm -qa | grep -i'
a go='function e { if [ -f $1 ]; then vim $1; elif [ -d $1 ]; then cd $1; else echo "ERROR: File/directory does not exist!"; fi }; e'
a mkcd='function e { mkdir -p $1 && cd $1; }; e $1'
a fuck='killall -9'
a be='bundle exec'
function calc() { echo $1 | bc -l; }
a whatarethecolours='for i in {0..8}; do tput setaf $i; echo -n $i; done; tput setaf 0; echo'
a xgrep='xargs grep'
function xargsvim() { xargs bash -c '</dev/tty vim "${@:0}"'; }
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
a agi='sudo apt-get install'
# a recreate_database='rake db:drop && rake db:create && rake db:hstoreize'
a recreate_database='rake db:drop && rake db:create'

# Default additional options for commands
# Warning: These all "overload" some default behaviour!
a grep='grep --color=auto'
a fgrep='fgrep --color=auto'
a egrep='egrep --color=auto'
a mkdir='mkdir -pv'
a cp='cp -i' # Prompt confirmation in case of file overwrite
a mv='mv -i'
a which='type -all'
a free='free -m' # Show sizes in Mb
a du='du -h --max-depth=1 -B K | sort -nr | more'
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
function fawk() # "Field awk" - e.g. `ls -lt | fawk 8` prints just the date fields.
{
  # TODO: Extend this to print multiple fields
  cmd="awk '{print \$$1}'"
  eval $cmd
}
function x() # Copy the output of any command to the clipboard, e.g. `x pwd`
{
  command echo -ne `$@` | tee >(xclip -i); echo
}


# Add colour to manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

unset source_if_exists # Not really needed outside of bashrc!
