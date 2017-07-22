# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
if [ "$(uname)" == "Darwin" ]; then
  configFile[0]="$HOME/.extra"
  configFile[1]="$HOME/.bash_prompt"
  configFile[2]="$HOME/.exports"
  configFile[3]="$HOME/.aliases"
  configFile[4]="$HOME/.functions"
  configFile[5]="$HOME/.mac"
else
  configFile[0]="$HOME/.extra"
  configFile[1]="$HOME/.bash_prompt"
  configFile[2]="$HOME/.exports"
  configFile[3]="$HOME/.aliases"
  configFile[4]="$HOME/.functions"
fi

for file in ${configFile[*]}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Init z (https://github.com/rupa/z)
. ~/.zdb/z.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# For ssh key forwarding
ssh-add > /dev/null 2>&1
