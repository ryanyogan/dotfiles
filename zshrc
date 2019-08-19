# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

GRADLE_HOME=/usr/local/gradle
export GRADLE_HOME
export PATH=$PATH:$GRADLE_HOME/bin

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Kafka
export PATH="$PATH:/Users/ryanyogan/kafka_2.12-2.0.0/bin"

export PATH="/Users/ryanyogan/flutter/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# WASM
alias wasm="docker exec -it wasm bash"

export PATH="$PATH:$HOME/.asdf/asdf.sh"
export PATH="$PATH:$HOME/.asdf/completions/asdf.bash"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/ryanyogan/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/ryanyogan/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/ryanyogan/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/ryanyogan/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

autoload -U promptinit; promptinit
prompt pure

# source <(antigen init)
source <(antibody init)
source ~/.zplug/init.zsh

# antigen use oh-my-zsh
# antigen bundle mafredri/zsh-async
# antigen bundle sindresorhus/pure

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

export PATH="$HOME/flutter/bin:$PATH"

export ERL_AFLAGS="-kernal shell_history enabled"


# added by travis gem
[ -f /Users/ryanyogan/.travis/travis.sh ] && source /Users/ryanyogan/.travis/travis.sh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/ryanyogan/.nvm/versions/node/v10.15.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/ryanyogan/.nvm/versions/node/v10.15.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/asdf.sh
