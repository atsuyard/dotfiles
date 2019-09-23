function is_managed_by_git() {
  [[ -z ${commands[git]} ]] && return 1
  git status &> /dev/null || return 1
}

function fga() { # git add をfilterで選択して行う。<C-v>でgit diffを表示。
  is_managed_by_git || return 1

  local file unadded_files
  for file in "${(f)$(git status --short)}"; do
    local header=$(echo ${file} | cut -c1-2)
    [[ ${header} == '??' || ${header} =~ '( |M|A|R|U)(M|U)' ]] \
      && local unadded_files="${unadded_files}\n$(echo ${file} | rev | cut -d' ' -f1 | rev)"
  done
  local selected_files=$(echo ${unadded_files} | sed /^$/d \
    | fzf --preview='git diff --color=always {}' --preview-window='right:95%:hidden' --bind='ctrl-v:toggle-preview')
  [[ -n ${selected_files} ]] && git add $@ $(echo ${selected_files} | tr '\n' ' ')
}

function fgco() { # git checkout の引数をfilterで選択する
  is_managed_by_git || return 1
  [[ -z ${commands[fzf]} ]] && return 1

  local -r branch=$(git branch | tr -d ' ' | sed /^\*/d | fzf)
  [[ -n ${branch} ]] && git checkout "${branch}"
}

function gmv() { # git mv
  is_managed_by_git || return 1
  [[ $# -ne 0 ]] || return 1
  [[ ${argv[$(expr $# - 1)]} == '-t' ]] || return 1

  local -r target=${argv[$#]}
  for i in {1..$(expr $# - 2)}; do
    git mv "${argv[$i]}" "${target}"
  done
}

function gss() {
  is_managed_by_git || return 1

  function filter() {
    git stash list \
      | fzf \
      --header="${1:-none}" \
      --preview='echo {} \
        | cut -d: -f1 \
        | xargs git stash show --color=always' \
      --preview-window='right:95%:hidden' \
      --bind='ctrl-v:toggle-preview' \
      | cut -d: -f1

  }

  case $1 in
    '-a'|'--apply' )
      local -r stash=$(filter 'apply')
      [[ -z ${stash} ]] && return 1
      git stash apply ${stash}
    ;;
    '-s'|'--show' )
      local -r stash=$(filter 'show')
      [[ -z ${stash} ]] && return 1
      git stash show -p ${stash}
    ;;
    '-d'|'--drop' )
      local -r stash=$(filter 'drop')
      [[ -z ${stash} ]] && return 1
      confirm git stash drop ${stash}
    ;;
    '-l'|'--list' ) # -p
      git stash list
    ;;
    * )
      [[ -z $1 ]] && return 1
      git stash save -u $1
    ;;
  esac
}

function gu() {
  is_managed_by_git || return 1
  xdg-open $(git config --get remote.origin.url)
}

function gph() {
  is_managed_by_git || return 1
  git push origin $(git branch | grep '^*' | cut -d' ' -f2)
}

function __git_branch_list__() {
  is_managed_by_git || return 1
  git branch | grep -v "^*" | tr -d " " | fzf
}

function __git_working_tree_status__() {
  is_managed_by_git || return 1
  git status --porcelain | grep -e '^??' -e '^.M' -e '^.D' \
    | cut -c 4- \
    | fzf --preview='git diff --color=always {}' \
      --preview-window='right:95%:hidden' \
      --bind='ctrl-v:toggle-preview'
}

alias gs='git status'
alias ga='git add'
alias gcm='git commit -m'
alias gl='git log'
alias gb='git branch'
alias gco='git checkout'
alias gpl='git pull origin'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc1='git clone -b master --depth 1'

alias -g @gb='$(__git_branch_list__)'
alias -g @gw='$(__git_working_tree_status__)'