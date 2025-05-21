# test -z "$TMUX" && (tmux attach || tmux new-session)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source ~/.config/zsh/.env.zsh
source ~/.config/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ALIASES
alias ls='eza -1alh -m --icons --git --no-permissions --no-user'
alias v='nvim'
alias vim='nvim'
alias rg="rg --hidden --glob '!.git'"

# Perform ls right after cd'ing
function chpwd() {
  eza -1alh -m --icons --git --no-permissions --no-user
}

clear_input_line() {
  clear -x
  zle kill-whole-line
  zle reset-prompt
}

zle -N clear_input_line

bindkey '^G' clear_input_line

[[ ! -f ~/.env.zsh ]] || source ~/.env.zsh
