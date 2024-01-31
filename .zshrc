echo "Loading zsh config..."

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Source .profile if it exists
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

# Allow direnv
eval "$(direnv hook zsh)"


#### ZSH ####
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "gnzh" "sunrise" )
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

#### GIT ####
export GIT_HOME="$HOME/git"

#### DOCKER ####
alias dps="docker ps"  # Get container process
alias dpsa="docker ps -a" # Get process included stop container

dstop() { docker stop $(docker ps -a -q); } # Stop all containers
drm() { docker rm $(docker ps -a -q); } # Remove all containers
dri() { docker rmi $(docker images -q); } # Remove all images
dnuke() { docker rm -f $(docker ps -aq); } # Stop all containers and remove all containers
dclean() { docker system prune -f && docker volume prune -f; } # Clean all unused images and volumes
dsh() { docker exec -it $(docker ps -f name=$1 -q) sh; } # Exec into a container matching the name

#### NVM ####
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### JAVA ####
# Try the macOS-specific command
if command -v /usr/libexec/java_home &> /dev/null; then
    JAVA_HOME_TRY=$(/usr/libexec/java_home -v 12.0.2 2>/dev/null)
fi

# If the above didn't work, try a common Linux path
if [ -z "$JAVA_HOME_TRY" ] && [ -d "/usr/lib/jvm/java-12-openjdk-amd64" ]; then
    JAVA_HOME_TRY="/usr/lib/jvm/java-12-openjdk-amd64"
fi

# If neither of the above worked, fall back to a default
JAVA_HOME=${JAVA_HOME_TRY:-""}

# Finally, export the value
export JAVA_HOME


#### VOX ####
if [ -d "$GIT_HOME/voxsupFrontend2" ]; then
    alias vox="$GIT_HOME/voxsupFrontend2/.vox"
fi

# opam configuration
[[ ! -r /home/sessionsdev/.opam/opam-init/init.zsh ]] || source /home/sessionsdev/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
