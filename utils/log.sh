red="\033[1;31m"
blue="\033[1;34m"
reset="\033[0;00m"

function info() {
  echo -en $blue
  echo -n "[i] "
  printf "$1" "$2"
  echo -en $reset
}

function error() {
  echo -en $red
  echo -n "[!] "
  printf "$1" "$2"
  echo -en $reset
}
