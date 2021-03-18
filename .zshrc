source /home/jlb/.antigen.zsh
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'r:|[._-; ]=* r:|=*' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/jlb/.zshrc'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export HISTSIZE=1024
export SAVEHIST=1024
bindkey -e
# End of lines configured by zsh-newuser-install

. /home/jlb/.local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

# Antigen packages
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Autosuggestions settings
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Some aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -ltrha'
alias la='ls -A'
alias l='ls -CF'

# Rust
source "$HOME/.cargo/env"

# Ruby
path+=("$HOME/.rbenv/bin")
eval "$(rbenv init -)"
path+=("$HOME/.rbenv/plugins/ruby-build/bin")

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export PATH

