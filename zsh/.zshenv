# .zshenv is loaded for the first time in zsh config files.
# .zshenv is the only zsh config file to load before execute shellscript.

# ~/.zshenv
# export ZDOTDIR="${HOME}/.zsh"
# source ${ZDOTDIR}/.zshenv

# ${ZDOTDIR}/.zshenv
export PATH='/usr/bin:/usr/bin/core_perl'
export LANG='ja_JP.UTF-8'
export TERM='xterm-256color'
export EDITOR='nvim' # lessでvを押すなどに使う
export SUDO_EDITOR='nvim -Zu NORC' # sudoedit file_name
export XDG_CONFIG_HOME="${HOME}/.config"
export GOPATH="${HOME}/workspace/go"

export TRASH_PATH="${HOME}/.Trash"
export SECOND_CMD_PATH="${HOME}/.second"