if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
export TERM=xterm-256color
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# use brew 10k
# ZSH_THEME="robbyrussell"
plugins=(git)

# source berw zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. $(brew --prefix)/etc/profile.d/z.sh

# Alias
alias vim="nvim"
alias ls="lsd"
alias ll="lsd -lh"
alias tmux="tmux -f ~/.config/tmux/.tmux.conf"
alias ide="tmux split-window -v -p 30
tmux split-window -h -p 66
tmux split-window -h -p 50"
alias zshrc="vim ~/.zshrc"
alias ssh="cd ~/.ssh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm setup
export NVM_DIR="$HOME/.nvm" 
source $(brew --prefix nvm)/nvm.sh
# sdkman setup
source "$HOME/.sdkman/bin/sdkman-init.sh"
