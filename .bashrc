PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin; export PATH
TZ=US/Pacific; export TZ
MAIL=~/Maildir; export MAIL
EDITOR=emacs; export EDITOR
VISUAL="$EDITOR"; export VISUAL
LANG=en_US.utf8; export LANG
INPUTRC=~/.inputrc; export INPUTRC

HISTCONTROL=ignoredups; export HISTCONTROL
set -o ignoreeof
shopt -s cdspell
shopt -s cmdhist
shopt -s extglob
shopt -s no_empty_cmd_completion
shopt -s progcomp
shopt -s hostcomplete
shopt -s interactive_comments
shopt -s promptvars
shopt -s checkwinsize

case "$TERM" in
  xterm|rxvt*|screen)
    [ -f /usr/bin/dircolors ] && eval `/usr/bin/dircolors -b`
    case `uname` in
      Linux) alias ls='ls --color=auto -F -b -T 0';;
    esac
    ;;
esac

case "$TERM" in
  rxvt*) TERM=xterm; export TERM;;
esac

alias emacs='emacs -nw'
alias screen='screen -D -R'
alias chromium='env auto_proxy= chromium'

black_="\[\033[0;30m\]"
blue_="\[\033[0;34m\]"
green_="\[\033[0;32m\]"
cyan_="\[\033[0;36m\]"
red_="\[\033[0;31m\]"
purple_="\[\033[0;35m\]"
brown_="\[\033[0;33m\]"
lightgray_="\[\033[0;37m\]"
gray_="\[\033[1;30m\]"
lightblue_="\[\033[1;34m\]"
lightgreen_="\[\033[1;32m\]"
lightcyan_="\[\033[1;36m\]"
lightred_="\[\033[1;31m\]"
lightpurple_="\[\033[1;35m\]"
lightyellow_="\[\033[1;33m\]"
white_="\[\033[1;37m\]"
nocolor_="\[\033[0m\]"

case `hostname -s` in
  rdoshi-*) promptcolor_="$green_" ;;
  *) promptcolor_="$lightgray_" ;;
esac

case `whoami` in
  root) promptchar_="${lightred_}#${nocolor_}" ;;
  *) promptchar_="${lightgray_}\$${nocolor_}" ;;
esac

prompttext_=`hostname -s`
PS1="${brown_}[${promptcolor_}${prompttext_}${white_}:${cyan_}\w${brown_}]${nocolor_}$promptchar_ "
PS2='> '
PS4='+ '

case "$TERM" in
  xterm|rxvt)
    PROMPT_COMMAND='echo -ne "\033]0;$HOSTNAME:$PWD\007"'
    ;;
esac

[ -f /usr/bin/keychain ] && eval `/usr/bin/keychain --eval --nogui -Q -q id_rsa`
