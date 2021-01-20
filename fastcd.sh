FastCD () {
  COUNTER=0
  if [[ $1 =~ ^[0-9]+$ ]] && [[ $1 -gt 0 ]]; then
    # for dir in */; do
    for dir in *; do
    # for dir in $(ls -G --group-directories-first); do
      (( COUNTER++ ))
      if [[ "$1" -eq "$COUNTER" ]]; then
        #pwd
        cd "$dir" && c
        # cd "$dir" && ls -G --group-directories-first --color=always | tr '\n' '\0' | xargs -0 -n 1 | nl
        #cd "$dir" && ls -a --group-directories-first --color=always | tr '\n' '\0' | xargs -0 -n 1 | nl
      fi
    done
  else
    #pwd
    cd "$@" && c
    # cd "$@" && ls -G --group-directories-first --color=always | tr '\n' '\0' | xargs -0 -n 1 | nl
   #cd "$dir" && ls -a --group-directories-first --color=always | tr '\n' '\0' | xargs -0 -n 1 | nl
  fi
}

c () {
  #pwd
  # ls -G --group-directories-first --color=always | tr '\n' '\0' | xargs -0 -n 1 | nl
  COUNT=0
  blue=`tput setaf 4`
  reset=`tput sgr0`
  for d in *; do
    ((COUNT ++))
          if [ -d "$d" ]; then
            printf "${reset} $COUNT ${blue}$d\n"
            # printf "${reset} $COUNT ${green} $d\n" 
          elif [ -f "$d" ]; then
            printf "${reset} $COUNT $d\n"
          fi
    done
}