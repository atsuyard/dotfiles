# tmuxの左のステータスバー
function _tmux_status() {
  # tmuxのSession番号を表示。commandがzshのときにはmodeも表示。

  [[ -z ${TMUX} ]] && return
  typeset -r sep=''
  [[ ${KEYMAP} == 'vicmd' ]] \
  && typeset -r mode="#[fg=black,bg=green]#{?#{==:#{pane_current_command},zsh}, -- NORM -- #[default]#[fg=green]#[bg=blue]#{?client_prefix,#[bg=yellow],}${sep},}" \
  || typeset -r mode="#[fg=blue,bg=black]#{?#{==:#{pane_current_command},zsh}, -- INS -- #[default]#[fg=black]#[bg=blue]#{?client_prefix,#[bg=yellow],}${sep},}"

  tmux set -g status-left "${mode}#[fg=black,bg=blue]#{?client_prefix,#[bg=yellow],} S/#S #[default]#[fg=blue]#{?client_prefix,#[fg=yellow],}${sep}"
}
zle -N zle-line-init _tmux_status
zle -N zle-keymap-select _tmux_status