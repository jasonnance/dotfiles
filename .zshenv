# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
export PATH="$PATH:$HOME/direnv"

# go
export PATH="$PATH:/usr/local/go/bin"
