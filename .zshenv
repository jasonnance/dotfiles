# general
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"

if [[ -d /opt/homebrew/bin ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# direnv
export PATH="$PATH:$HOME/direnv"

# go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/golang"
export PATH="$PATH:$(go env GOPATH)/bin"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

# yarn
export PATH="$PATH:$HOME/.yarn/bin"
