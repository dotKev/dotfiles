# Docker Compose zsh plugin
plugins+=(docker-compose)

# Docker Compose aliases
alias dc="docker-compose"
alias dcb="docker-compose build --pull"
alias dcd="docker-compose down --rmi local -v --remove-orphans"
alias dce="docker-compose exec"
alias dck="docker-compose kill"
alias dcp="docker-compose pull"
alias dcps="docker-compose ps"
alias dcr="docker-compose run"
alias dcrm="docker-compose rm -f -v"
alias dcu="docker-compose up -d"
