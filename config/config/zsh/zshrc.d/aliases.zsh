alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -FAlhtr --color=auto --time-style="+%Y/%m/%d %H:%M:%S"'
alias grep='grep --color=auto'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias rm=':'
alias mkdir='mkdir -pv'
alias hist='history -i 1'
alias free='free -wh'
alias du='du -h'
alias df='df -Th'
alias mk='make'
if [[ ${OSTYPE} == 'linux-gnu' ]]; then
  alias pgrep='pgrep --list-full'
fi
alias diff='diff --color'
alias ip='ip --color=auto'
alias nano='nano -$ -l -i -O -m -c' # '-$liOmc' does not work.

alias tree='tree -C'
alias dc='docker-compose'
alias bc='bluetoothctl'
alias poweroff='confirm systemctl poweroff'
alias reboot='confirm systemctl reboot'
alias logout='confirm i3-msg exit'
alias xbg="xbacklight -get | xargs printf '%.0f%%\n'"
alias xephyr='Xephyr -wr -resizeable :1'
# alias lock='light-locker-command -l'
alias lock='i3lock'
alias noise='paplay /usr/share/sounds/alsa/Noise.wav'
alias wallpaper='feh --no-fehbg --bg-scale /home/tayusa/contents/pictures/wallpaper/arch/Ju5PuBC.jpg'
alias pip-upgrade="pip list -o | sed '1,2d' | tr -s ' ' | cut -d' ' -f1 | xargs -I{} pip install -U {}"
alias ss='gnome-screenshot --area'
alias pip3-upgrade="pip3 list -o | sed '1,2d' | tr -s ' ' | cut -d' ' -f1 | xargs -I{} pip3 install -U {}"

alias -g @g='| grep'
alias -g @l='| less'
alias -g @j='| jq'
alias -g L='$(ls | fzf)'
alias -g F='$(find -type f | fzf)'
alias -g ..2='../..'
alias -g ..3='../../..'

alias -s txt='less'
alias -s {html,md,pdf,mp3,mp4}='chromium'
alias -s {png,jpg,jpeg}='feh'
