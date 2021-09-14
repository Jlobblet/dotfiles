source "$HOME/.antigen.zsh"
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'r:|[._-; ]=* r:|=*' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export HISTSIZE=16384
export SAVEHIST=16384
bindkey -e
# End of lines configured by zsh-newuser-install

# Ctrl + Left/Right arrows to skip a word
bindkey $terminfo[kLFT5] backward-word
bindkey $terminfo[kRIT5] forward-word

# Powerline setup
. "$HOME/.local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh"

# Antigen packages
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Autosuggestions settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# Some aliases
alias ls='lsd --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='lsd -ltrha'
alias la='lsd -A'
alias l='lsd -F'

# Exports
export EDITOR=/usr/bin/vim

# Rust
source "$HOME/.cargo/env"

# Ruby
path+=("$HOME/.rbenv/bin")
eval "$(rbenv init -)"
path+=("$HOME/.rbenv/plugins/ruby-build/bin")

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Conda, a package manager
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        path+=("$HOME/anaconda3/bin")
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Go
path+=("/usr/local/go/bin/")

# SDKMan, for Java
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Command line tools
source "$HOME/.config/broot/launcher/bash/br" # This seems to work fine

# Re-export path
export PATH



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

