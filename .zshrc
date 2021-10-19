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

# Add local autocompletion scripts
fpath+=("$HOME/.local/share/zsh/completions")

# envmng
envmng() {
	eval $(envmng-exe "$@")
}

# Rust
path+=("$HOME/.cargo/bin")

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Go
path+=("/usr/local/go/bin/")

# Command line tools
source "$HOME/.config/broot/launcher/bash/br" # This seems to work fine

# Re-export path
export PATH

