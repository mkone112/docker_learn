export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bullet-train"

plugins=(git sudo grc)

source $ZSH/oh-my-zsh.sh

alias ls="ls -a"

BULLETTRAIN_PROMPT_ORDER=(
  cmd_exec_time
  status
  custom
  context
  dir
  screen
  perl
  ruby
  virtualenv
  nvm
  aws
  go
  rust
  elixir
  git
  hg
)
BULLETTRAIN_CONTEXT_DEFAULT_USER=mk

#История становится общей между всеми сессиями / терминалами.
setopt share_history

# Дополнение файла истрии
setopt  APPEND_HISTORY

#Добавить команду в историю не после выполнения а перед
setopt INC_APPEND_HISTORY

# Игнopupoвaть вce пoвтopeнuя команд
setopt  HIST_IGNORE_ALL_DUPS

# Удалять из файл истории пустые строки
setopt  HIST_REDUCE_BLANKS

export LD_PRELOAD="/home/mk/.bashextensions/stderred/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"

bindkey " " magic-space ## do history expansion on space
