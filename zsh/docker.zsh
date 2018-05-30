# Docker zsh plugin
plugins+=(docker)

# Docker aliases
alias de="docker exec -it"
alias di="docker images"
alias dps="docker ps -a"
alias drm="docker rm -v"
alias drmc="docker ps -a -q | xargs docker rm -v"
alias drmi="docker rmi"
alias drmid="docker images -qf 'dangling=true' | xargs docker rmi"
alias drmvd="docker volume ls -qf 'dangling=true' | xargs docker volume rm"
