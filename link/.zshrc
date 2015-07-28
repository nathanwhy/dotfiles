export LANG=en_US.UTF-8

# Where the magic happens.
export DOTFILES=$HOME/.dotfiles

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source all files in "source"
function src() {
  local file
  for file in $DOTFILES/source/*; do
    source "$file"
  done
}

src
