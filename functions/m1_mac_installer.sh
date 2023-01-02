brew_apps=(
"neovim"
"mas"
"git"
"tmux"
"romkatv/powerlevel10k/powerlevel10k"
"zsh-autosuggestions"
"zsh-syntax-highlighting"
"z"
"lsd"
"nvm"
"ripgrep"
"htop"
"wget"
)
cask_apps=(
"topnotch"
"google-chrome"
"iterm2"
"notion"
"postman"
"slack"
"intellij-idea"
"todoist"
)
mas_apps=('KakaoTalk')

# install brew
if ! command -v brew &> /dev/null; then
  echo "<ohmyzsh> \033[31;1m"Start Install..."\033[m"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "<ohmyzsh> \033[32;1m"Install Finish!!"\033[m"
fi

brew update
brew upgrade

# install oh-my-zsh
if [[ -f "~/.zshrc" ]]; then
  echo "<ohmyzsh> \033[31;1m"Start Install..."\033[m"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "<ohmyzsh> \033[32;1m"Install Finish!!"\033[m"
fi

function install_app() {
  option=$2
  name=$1[@]
  arr=${!name}
  for app in ${arr[@]}; do
    if ! brew list ${option} ${app} &> /dev/null; then
      echo "<$app> \033[31;1m"Start Install..."\033[m"
      if "font-hack-nerd-font" == "${app}"; then
        brew tap homebrew/cask-fonts
      fi
      brew install ${option} ${app}
      echo "<$app> \033[32;1m"Install Finish!!"\033[m"
    else
      echo "<$app> \033[32;1m"Already Installed!!"\033[m"
    fi
  done
}

function install_mas_app() {
  for app in ${mas_apps[@]}; do
    if ! mas list | grep "${app}" &> /dev/null; then
      echo "<$app> \033[31;1m"Start Install..."\033[m"
      mas search "${app}" | sed -n "/${app}/p" | sed -nr "s/ ${app}.+//p" | xargs -I{} mas install {}
      echo "<$app> \033[32;1m"Install Finish!!"\033[m"
    else
      echo "<$app> \033[32;1m"Already Installed!!"\033[m"
    fi
  done
}

install_app brew_apps
install_app cask_apps "--cask"
install_mas_app

if [[ ! -f $HOME/.sdkman/bin/sdkman-init.sh ]]; then
  echo "<sdk> \033[31;1m"Start Install..."\033[m"
  curl -s "https://get.sdkman.io" | bash
  echo "<sdk> \033[32;1m"Install Finish!!"\033[m"
else 
  echo "<sdk> \033[32;1m"Already Installed!!"\033[m"
fi

cp -r ../nvim ~/.config/
cp -r ../tmux ~/.config/
cp ../shell/.zshrc ~
cp ../.ideavimrc ~
