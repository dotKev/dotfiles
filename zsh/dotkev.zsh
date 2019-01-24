MAILCHECK=0
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Applications/google-cloud-sdk/path.zsh.inc' ]; then source '/Applications/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Applications/google-cloud-sdk/completion.zsh.inc' ]; then source '/Applications/google-cloud-sdk/completion.zsh.inc'; fi

make() {
    base_dir="${PWD}"
    (
        while [ "${PWD}" != '/' ] && [ ! -e 'Makefile' ]; do
            cd ..
        done
        if [ -e 'Makefile' ]; then
          command make "${@}"
        else;
          echo "Unable to find a Makefile"
        fi
    ) && cd "${base_dir}" || cd "${base_dir}"
}

alias frontend='docker-compose exec frontend bash'
alias fe='frontend'
alias mysw='docker-compose exec mysidewalk bash'
alias dev='cd ~/dev'
alias backup-boost='sudo sysctl debug.lowpri_throttle_enabled=0'
alias backup-throttle='sudo sysctl debug.lowpri_throttle_enabled=1'
alias gllt='cd /Applications/MAMP/htdocs/gllt/wp-content/themes/gllt'
alias htdocs='cd /Applications/MAMP/htdocs'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222'

_tmux_hook() {
  # This function should be used as the iterm2 command to run on terminal open
  #
  # Create a new tmux session if it doesn't exists. Otherwise, create a new grouped session and clean it up on exit.
  # This allows multiple terminals to view different tmux windows. Requires gnu xargs - brew install findutils
  tmux new -s base || \
    tmux new -t base \
    | awk '{ gsub("\\)]", "", $4); print $4 }' \
    | gxargs --no-run-if-empty tmux kill-session -t
}

# start in dev
if [[ $PWD == $HOME ]]; then
    dev
fi
