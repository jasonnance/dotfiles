# general
export PATH="/usr/local/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - --no-rehash zsh)"

# direnv
export PATH="$PATH:$HOME/direnv"

# go
export PATH="$PATH:/usr/local/go/bin"

# yarn
export PATH="$PATH:$HOME/.yarn/bin"
