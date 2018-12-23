alias la='ls -A --color=auto'
alias ll='ls -FAlht --color=auto'
alias grep='grep --color=auto'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias rm="echo 'zsh: command not found: rm'"
alias mkdir='mkdir -pv'
alias hist='history -i 1'
alias free='free -hw'
alias du='du -h'
alias df='df -hT'
alias ip='ip -c'
alias pgrep='pgrep -a'
alias diff='diff --color'
alias nano='nano -$ -l -i -O -m -c' # オブションは個々に指定してないと効かない

alias tree='tree -C'
alias xbg="xbacklight -get | xargs printf '%.0f%%\n'"
alias xephyr='Xephyr -wr -resizeable :1' # x serverのネスト。白背景。window可変。
alias open='xdg-open'
alias c='chromium'
alias noise='paplay /usr/share/sounds/alsa/Noise.wav'
alias poweroff='interactive systemctl poweroff'
alias reboot='interactive systemctl reboot'
alias logout='interactive i3-msg exit'
alias lock='light-locker-command -l'
alias set_wallpaper='feh --no-fehbg --bg-scale /home/tayusa/contents/pictures/wallpaper/arch/Ju5PuBC.jpg'

alias -g @g='| grep'
alias -g @l='| less'
alias -g @j='| jq'
alias -g lf='$(ls | fzf)'
alias -g ff='$(find -type f | fzf)'
alias -g ..2='../..'
alias -g ..3='../../..'

alias -s txt='less'
alias -s {html,md,pdf,mp3,mp4}='chromium'
alias -s {png,jpg,jpeg}='feh'

# docker error creating new backup file
alias no_metacopy='echo N | sudo tee /sys/module/overlay/parameters/metacopy'
