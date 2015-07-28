# Exit if, for some reason, ZSH is not installed.
[[ ! "$(type -P zsh)" ]] && e_error "ZSH failed to install." && return 1

if [[ ! -d $HOME/.zprezto ]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
fi

if ! grep -q "/usr/local/bin/zsh" "/etc/shells"; then
  echo "Add zsh to /etc/shells."
  command -v zsh | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "/usr/local/bin/zsh" ]]; then
  echo "$ZSH_NAME"
  chsh -s "$(command -v zsh)" "${USER}"
fi
