
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:$HOME/.toolbox/bin

#PS1='%n@%m %~$ '
#PS1='%m %1d$ '

 # some more ls aliases
 #alias ll='ls -alF --color'
 #alias la='ls -A --color'
 #alias l='ls -CF --color'

 alias grep='grep --color=auto'
 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'

export EDITOR=vim
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[a" beginning-of-line  # Option + A (Esc + A)"]"
bindkey "^[e" end-of-line  # Option + E (Esc + E)"]"

bindkey "^[b" backward-word  # Option + Left Arrow"]"
bindkey "^[f" forward-word   # Option + Right Arrow"]"

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"         
eval "$(pyenv init --path)"
eval "$(pyenv init -)"   

# ---- FZF -----# 
# Set up fzf key bindings and fuzzy completione
eval "$(fzf --zsh)"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="-- preview 'eza --tree --color=always {} | head -200'"
export TMUX_CONF_LOCAL="$HOME/.tmux.conf.local"
export TMUX_CONF="$HOME/.tmux.conf"

# Advanced customization of fzf options via _fzf_comprun      function# - The first argument to the function is the name of the comm  and.# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() { 
    local command=$1
    shift

    case "$command" in    
        export|unset) fzf --preview "eval 'echo $'{}"             "$@" ;;    
        ssh)          fzf --preview 'dig {}'                   "$@"  ;;    
        *)            fzf --preview "bat -n --color=always --line-range   :500 {}" "$@" ;;  esac}        

# ----- Bat (better cat) -----
export BAT_THEME="Visual Studio Dark+"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
set rtp+=/opt/homebrew/opt/fzf

# ---- Eza (better ls) -----
alias ls="eza --icons=always"       
alias ll="ls -la --no-user"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"


# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# ---- Zoxide (better cd) ----
eval "$(zoxide init    zsh)"
alias cd="z"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

eval "$(/opt/homebrew/bin/brew shellenv)"
# Set up mise for runtime management
eval "$(mise activate zsh)"




