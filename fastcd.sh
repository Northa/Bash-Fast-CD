FastCD () {
  COUNTER=0
  if [[ $1 =~ ^[0-9]+$ ]] && [[ $1 -gt 0 ]]; then
    for dir in *; do
      (( COUNTER++ ))
      if [[ "$1" -eq "$COUNTER" ]]; then
        cd "$dir" && c
      fi
    done
  else
    cd "$@" && c
  fi
}

c () {
  COUNT=0
  blue=`tput setaf 4`
  reset=`tput sgr0`
  for d in *; do
    ((COUNT ++))
          if [ -d "$d" ]; then
            printf "${reset} $COUNT ${blue}$d\n"
          elif [ -f "$d" ]; then
            printf "${reset} $COUNT $d\n"
          else
            printf "${reset} $COUNT $d\n"
          fi
    done
}